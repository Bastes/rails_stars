require 'spec_helper'

describe RailsStars::Star do
  let(:giver) { StarGiver.create }
  let(:other_giver) { StarGiver.create }
  let(:receiver) { StarReceiver.create }
  let(:other_receiver) { StarReceiver.create }

  it { should allow_mass_assignment_of(:anchor) }
  it { should allow_mass_assignment_of(:star_giver) }
  it { should allow_mass_assignment_of(:rating) }

  context 'without any rating given' do
    subject { receiver.receive_stars rating: nil }

    its(:rating) { should == 0 }
  end

  describe '.where_giver' do
    let!(:star) { giver.give_stars receiver }
    let!(:other_star) { other_giver.give_stars receiver }
    subject { RailsStars::Star.where_giver(giver) }

    it { should == [star] }
  end

  describe '.where_receiver' do
    let!(:star) { giver.give_stars receiver }
    let!(:other_star) { giver.give_stars other_receiver }
    subject { RailsStars::Star.where_receiver(receiver) }

    it { should == [star] }
  end
end
