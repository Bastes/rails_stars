require 'spec_helper'

describe RailsStars::ActsAsStarGiver do
  let(:giver) { StarGiver.create }
  let(:receiver) { StarReceiver.create }
  subject { giver }

  context 'giving a star to a receiver' do
    it { expect { subject.give_stars receiver }.
      to change(subject.stars_given, :count).by(1) }

    describe 'the star created' do
      subject { giver.give_stars receiver, rating: 3 }

      it { should == giver.stars_given.first }
      it { should == receiver.stars_received.first }
      its(:rating)        { should == 3 }
      its(:star_receiver) { should == receiver }
      its(:star_giver)    { should == giver }
    end
  end

  describe '.stars_given.where_receiver' do
    let(:other_giver)     { StarGiver.create }
    let(:other_receiver)  { StarReceiver.create }
    let!(:star_expected)  { giver.give_stars receiver, rating: 5 }
    before { giver.give_stars other_receiver, rating: 2 }
    before { other_giver.give_stars receiver, rating: 4 }
    subject { giver.stars_given.where_receiver(receiver) }

    it { should == [star_expected] }
  end
end
