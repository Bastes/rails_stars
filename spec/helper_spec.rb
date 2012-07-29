require 'spec_helper'

describe RailsStars::Helper, type: :helper do
  before { @star_receiver = StarReceiver.create }

  it 'displays the rating node for the receiver' do
    helper.stars_for(@star_receiver).should have_selector("[data-stars-for=\"http://test.host/star_receivers/#{@star_receiver.id}/stars\"]")
  end

  it 'displays the stars rating average of the reciver' do
    [1,3,4,2,5].each { |r| @star_receiver.receive_stars rating: r }
    helper.stars_for(@star_receiver).should have_selector('[data-stars-average="3"]')
  end

  it 'displays the stars rating average rounded to nearest unit' do
    [4,5,5,5].each { |r| @star_receiver.receive_stars rating: r }
    helper.stars_for(@star_receiver).should have_selector('[data-stars-average="5"]')
  end

  it 'displays the number of stars of the reciver' do
    11.times { @star_receiver.receive_stars }
    helper.stars_for(@star_receiver).should have_selector('[data-stars-count="11"]')
  end
end
