require 'spec_helper'

describe RailsStars::StarsController do
  describe 'POST create' do
    let(:star_receiver) { StarReceiver.create }
    let(:anchor) { star_receiver.stars_anchor! }
    let(:parameters) do
      [
        :create,
        star: {
          anchor_id: anchor.id,
          rating: 4
        },
        use_route: :rails_stars
      ]
    end

    describe 'without a star_giver' do
      it { expect { post *parameters }.
        to change(star_receiver.stars_received, :count).by(1) }

      describe 'the response' do
        before { post *parameters }
        subject { response }

        its(['Content-Type']) { should include('application/json') }

        describe 'JSON body' do
          subject { JSON(response.body) }

          its(['rating'])  { should == 4 }
          its(['average']) { should == 4 }
          its(['count'])   { should == 1 }
        end
      end
    end

    describe 'with a current_star_giver' do
      let(:star_giver) { StarGiver.create }
      before { controller.expects(:current_star_giver).returns star_giver }

      it { expect { post *parameters }.
        to change(star_giver.stars_given, :count).by(1) }

      context "with another star rating for the same giver and receiver" do
        let!(:other_star) { star_giver.give_stars star_receiver, rating: 1 }

        it { expect { post *parameters }.
          not_to change(star_giver.stars_given, :count) }

        describe 'the original star' do
          subject { other_star.reload }
          before { post *parameters }

          its(:rating) { should == 4 }
        end
      end

      context 'with stars given to another receiver' do
        let!(:other_receiver) { StarReceiver.create }
        let!(:other_star)     { star_giver.give_stars other_receiver, rating: 2 }

        describe 'the other star' do
          subject { other_star.reload }
          before { post *parameters }

          its(:rating) { should == 2 }
        end
      end

      context 'with stars given by another giver' do
        let!(:other_giver) { StarGiver.create }
        let!(:other_star)  { other_giver.give_stars star_receiver, rating: 3 }

        describe 'the oother star' do
          subject { other_star.reload }
          before { post *parameters }

          its(:rating) { should == 3 }
        end
      end
    end

    describe 'with a nil current_star_giver' do
      before { controller.expects(:current_star_giver).returns nil }

      it { expect { post *parameters }.
        to change(star_receiver.stars_received, :count).by(1) }

      describe 'the star generated' do
        subject { RailsStars::Star.last }
        before { post *parameters }

        its(:rating)        { should == 4 }
        its(:star_receiver) { should == star_receiver }
        its(:star_giver)    { should be_nil }
      end
    end

    describe 'with a false current_star_giver' do
      before { controller.expects(:current_star_giver).returns false }

      it { expect { post *parameters }.
        not_to change(star_receiver.stars_received, :count) }

      describe 'the response' do
        subject { response }
        before { post *parameters }

        its(:status) { should == 401 }
      end
    end
  end
end
