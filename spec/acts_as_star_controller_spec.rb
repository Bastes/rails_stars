require 'spec_helper'

describe RailsStars::ActsAsStarController, type: :controller do
  controller do
    grants_stars to: StarReceiver
  end

  it 'can grant your rating to a receiver model' do
    @star_receiver = StarReceiver.create
    post 'stars', id: @star_receiver.id, rating: 4
    @star_receiver.stars_received.first.rating.should == 4
  end
end
