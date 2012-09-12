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

  it 'can find stars by giver' do
    other_giver = StarGiver.create
    receiver = StarReceiver.create
    other_receiver = StarReceiver.create
    subject.give_stars receiver, rating: 3
    stars_expected = [subject.stars_given.first]
    subject.give_stars other_receiver, rating: 2
    other_giver.give_stars receiver, rating: 4
    subject.stars_given.where_receiver(receiver).should == stars_expected
  end
end
