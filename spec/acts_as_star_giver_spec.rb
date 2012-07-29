require 'spec_helper'

describe RailsStars::ActsAsStarGiver do
  subject { StarGiver.create }

  before { @star_receiver = StarReceiver.create }

  it 'allows to give stars' do
    subject.give_stars @star_receiver
    @star_receiver.stars_received.count.should == 1
  end

  it 'allows to give rated stars' do
    subject.give_stars @star_receiver, rating: 3
    @star_receiver.stars_received.first.rating.should == 3
  end
end
