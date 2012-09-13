require 'spec_helper'

describe RailsStars::Star do
  let(:giver) { StarGiver.create }
  let(:other_giver) { StarGiver.create }
  let(:receiver) { StarReceiver.create }
  let(:other_receiver) { StarReceiver.create }

  it { should allow_mass_assignment_of(:star_receiver) }
  it { should allow_mass_assignment_of(:star_receiver_type) }
  it { should allow_mass_assignment_of(:star_receiver_id) }
  it { should allow_mass_assignment_of(:star_giver) }
  it { should allow_mass_assignment_of(:rating) }

  it 'sets a zero rating by default if nil' do
    star = RailsStars::Star.create(star_receiver: receiver, rating: nil)
    star.rating.should == 0
  end

  it 'can search stars by giver' do
    star = RailsStars::Star.create(star_giver: giver, star_receiver: receiver)
    other_star = RailsStars::Star.create(star_giver: other_giver, star_receiver: receiver)
    RailsStars::Star.where_giver(giver).should == [star]
  end

  it 'can search stars by receiver' do
    star = RailsStars::Star.create(star_giver: giver, star_receiver: receiver)
    other_star = RailsStars::Star.create(star_giver: giver, star_receiver: other_receiver)
    RailsStars::Star.where_receiver(receiver).should == [star]
  end
end
