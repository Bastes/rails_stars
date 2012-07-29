require 'spec_helper'

describe RailsStars::ActsAsStarReceiver do
  subject { StarReceiver.create }

  it 'allows to receive stars' do
    subject.receive_stars
    subject.stars_received.count.should == 1
  end

  it 'allows to receive rated stars' do
    subject.receive_stars rating: 5
    subject.stars_received.first.rating.should == 5
  end

  it 'gives a 0 default rating' do
    subject.receive_stars
    subject.stars_received.first.rating.should == 0
  end

  it 'can receive stars from a giver' do
    star_giver = StarGiver.create
    subject.receive_stars giver: star_giver
    star_giver.stars_given.count.should == 1
  end

  it 'knows it star_average' do
    [1,3,5,2,5,2].each { |r| subject.receive_stars rating: r }
    subject.star_average.should == 3
  end

  it 'knows its star_count' do
    [3,4,5,4,1,5,1,3].each { |r| subject.receive_stars rating: r }
    subject.star_count.should == 8
  end
end
