require 'spec_helper'


describe RailsStars::StarsController do
  describe 'POST create' do
    let(:star_receiver) { StarReceiver.create }
    let(:parameters) { [:create, star: { star_receiver_type: star_receiver.class.to_s, star_receiver_id: star_receiver.id, rating: 4 }, :use_route => :rails_stars] }

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
end
