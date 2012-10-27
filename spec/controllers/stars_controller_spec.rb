require 'spec_helper'

describe RailsStars::StarsController do
  describe 'POST create' do
    let(:star_receiver) { StarReceiver.create }
    let(:parameters) { [:create, star: { star_receiver_type: star_receiver.class.to_s, star_receiver_id: star_receiver.id, rating: 4 }, :use_route => :rails_stars] }

    describe 'without a star_giver' do
      it 'creates a Star given proper parameters' do
        expect {
          post *parameters
        }.to change(star_receiver.stars_received, :count).by(1)
      end

      it 'should return a json representation of the rating results' do
        post *parameters
        response.header['Content-Type'].should include 'application/json'
      end

      it 'should present the given rating' do
        post *parameters
        JSON.parse(response.body)['rating'].to_i.should == 4
      end

      it 'should present the given average' do
        post *parameters
        JSON.parse(response.body)['average'].to_i.should == 4
      end

      it 'should present the given count' do
        post *parameters
        JSON.parse(response.body)['count'].to_i.should == 1
      end
    end

    describe 'with a star_giver' do
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
  end
end
