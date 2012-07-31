require 'spec_helper'

describe RailsStars::StarsController, type: :controller do
  it 'can grant stars to a receiver model' do
    @star_receiver = StarReceiver.create
    post 'stars', star_receiver: @star_receiver, rating: 4
    @star_receiver.stars_received.first.rating.should == 4
  end
end
