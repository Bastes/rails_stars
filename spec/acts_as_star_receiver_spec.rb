require 'spec_helper'

describe RailsStars::ActsAsStarReceiver do
  let(:receiver) { StarReceiver.create }
  let(:giver)    { StarGiver.create }
  subject        { receiver }

  context 'receiving a star' do
    it { expect { subject.receive_stars }.
      to change(subject.stars_received, :count).by(1) }

    context 'without a giver' do
      describe 'the star created' do
        context 'with a rating' do
          subject { receiver.receive_stars rating: 5 }

          it { should == receiver.stars_received.first }
          its(:rating)        { should == 5 }
          its(:star_receiver) { should == receiver }
          its(:star_giver)    { should be_nil }
        end

        context 'without a rating' do
          subject { receiver.receive_stars }

          its(:rating) { should == 0 }
        end
      end
    end

    context 'with a giver' do
      it { expect { receiver.receive_stars giver: giver }.
        to change(giver.stars_given, :count).by(1) }

      describe 'the star created' do
        subject { receiver.receive_stars giver: giver }

        its(:star_giver) { should == giver }
      end
    end
  end

  describe '.star_average and .star_count' do
    before { [1,3,5,2,5,2].each { |r| subject.receive_stars rating: r } }

    its(:star_average) { should == 3 }
    its(:star_count)   { should == 6 }
  end

  describe '.stars_received.where_giver' do
    let(:other_giver)    { StarGiver.create }
    let(:other_receiver) { StarReceiver.create }
    let!(:star_expected) { receiver.receive_stars giver: giver, rating: 3 }
    before { other_receiver.receive_stars giver: giver, rating: 1 }
    before { receiver.receive_stars giver: other_giver, rating: 2 }
    subject { receiver.stars_received.where_giver(giver) }

    it { should == [star_expected] }
  end
end
