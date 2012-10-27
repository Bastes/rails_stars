require 'spec_helper'

describe RailsStars::Helper, type: :helper do
  let(:star_receiver) { StarReceiver.create }

  describe '.stars_for' do
    subject { helper.stars_for(star_receiver) }

    it { should have_selector("form[action=\"#{url_for([rails_stars, RailsStars::Star.new])}\"]") }

    context 'with some ratings' do
      before { [3,5,4,3,5].each { |r| star_receiver.receive_stars rating: r } }
      it { should have_selector('form[data-stars-average="4"]') }
      it { should have_selector('form[data-stars-count="5"]') }
    end

    it { should have_selector('input[name="star[star_receiver_type]"][value="StarReceiver"]') }
    it { should have_selector("input[name=\"star[star_receiver_id]\"][value=\"#{star_receiver.id}\"]") }
  end
end
