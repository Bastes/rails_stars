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

  context 'without any rating given' do
    subject { RailsStars::Star.create(star_receiver: receiver, rating: nil) }

    its(:rating) { should == 0 }
  end

  describe '.where_giver' do
    let!(:star) { RailsStars::Star.create(star_giver: giver, star_receiver: receiver) }
    let!(:other_star) { RailsStars::Star.create(star_giver: other_giver, star_receiver: receiver) }
    subject { RailsStars::Star.where_giver(giver) }

    it { should == [star] }
  end

  describe '.where_receiver' do
    let!(:star) { RailsStars::Star.create(star_giver: giver, star_receiver: receiver) }
    let!(:other_star) { RailsStars::Star.create(star_giver: giver, star_receiver: other_receiver) }
    subject { RailsStars::Star.where_receiver(receiver) }

    it { should == [star] }
  end
end
