require 'spec_helper'

describe RailsStars::Helper, type: :helper do
  before { @star_receiver = StarReceiver.create }

  it 'displays the rating node for the receiver' do
    helper.stars_for(@star_receiver).should have_selector("form[action=\"#{url_for([rails_stars, RailsStars::Star.new])}\"]")
  end

  it 'displays the stars rating average of the reciver' do
    [1,3,4,2,5].each { |r| @star_receiver.receive_stars rating: r }
    helper.stars_for(@star_receiver).should have_selector('form[data-stars-average="3"]')
  end

  it 'displays the stars rating average rounded to nearest unit' do
    [4,5,5,5].each { |r| @star_receiver.receive_stars rating: r }
    helper.stars_for(@star_receiver).should have_selector('form[data-stars-average="5"]')
  end

  it 'displays the number of stars of the reciver' do
    11.times { @star_receiver.receive_stars }
    helper.stars_for(@star_receiver).should have_selector('form[data-stars-count="11"]')
  end

  it 'holds the receivers type' do
    helper.stars_for(@star_receiver).should have_selector('input[name="star[star_receiver_type]"][value="StarReceiver"]')
  end

  it 'holds the receivers id' do
    helper.stars_for(@star_receiver).should have_selector("input[name=\"star[star_receiver_id]\"][value=\"#{@star_receiver.id}\"]")
  end
end
