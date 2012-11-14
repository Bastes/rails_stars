require 'spec_helper'

describe RailsStars::Helper, type: :helper do
  let(:star_receiver) { StarReceiver.create }

  describe '.stars_form_for' do
    subject { helper.stars_form_for(star_receiver) }

    it { should have_selector("form[action=\"#{url_for([rails_stars, RailsStars::Star.new])}\"]") }
    it { should_not have_selector('form#new_star') }
    it { should have_selector("input[name=\"star[anchor_id]\"]") }

    context 'with some ratings' do
      before { [5,4,5].each { |r| star_receiver.receive_stars rating: r } }
      it { should have_selector('form[data-stars-average="4.7"]') }
      it { should have_selector('form[data-stars-count="3"]') }
    end
  end

  describe '.stars_for' do
    subject { helper.stars_for(star_receiver) }

    context 'without ratings' do
      it { should == '0.0 / 0' }
    end

    context 'with some ratings' do
      before { [2,1,3,5,3].each { |r| star_receiver.receive_stars rating: r } }

      it { should == '2.8 / 5' }
    end
  end
end
