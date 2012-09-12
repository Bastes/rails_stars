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
      before do
        controller.expects(:current_star_giver).returns star_giver
      end

      it 'creates a Star with the proper star_giver' do
        expect {
          post *parameters
        }.to change(star_giver.stars_given, :count).by(1)
      end

      describe "when another star rating has been created for the same giver and receiver" do
        before do
          star_giver.give_stars star_receiver, rating: 1
          @other_star = star_giver.stars_given.first
        end

        it 'does not create a duplicate' do
          expect {
            post *parameters
          }.not_to change(star_giver.stars_given, :count)
        end

        it 'does however change the rating of the original' do
          post *parameters
          @other_star.reload.rating.should == 4
        end

        it 'does not change any other rating for this giver' do
          unrelated_receiver = StarReceiver.create
          star_giver.give_stars unrelated_receiver, rating: 2
          unrelated_star = unrelated_receiver.stars_received.first
          post *parameters
          unrelated_star.reload.rating.should == 2
        end

        it 'does not change any other rating for this receiver' do
          unrelated_giver = StarGiver.create
          unrelated_giver.give_stars star_receiver, rating: 3
          unrelated_star = unrelated_giver.stars_given.first
          post *parameters
          unrelated_star.reload.rating.should == 3
        end
      end
    end
  end
end
