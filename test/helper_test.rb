require 'test_helper'

class HelperTest < ActionView::TestCase
  include RailsStars::Helper

  setup do
    @star_receiver = StarReceiver.create
  end

  test 'stars_for displays the rating node for the receiver' do
    render :text => stars_for(@star_receiver)
    assert_select '[data-stars-for=?]', %r{http://[^/]+/star_receivers/#{@star_receiver.id}/stars}
  end

  test 'stars_for displays the stars rating average of the reciver' do
    assert_average [1,3,4,2, 5], 3
  end

  test 'stars_for displays the stars rating average rounded to nearest unit' do
    assert_average [4,5,5,5], 5
  end

  test 'stars_for displays the number of stars of the reciver' do
    11.times { @star_receiver.receive_stars }

    render :text => stars_for(@star_receiver)
    assert_select '[data-stars-for][data-stars-count=?]', 11
  end

  def assert_average serie, expected
    serie.each { |r| @star_receiver.receive_stars rating: r }

    render :text => stars_for(@star_receiver)
    assert_select '[data-stars-for][data-stars-average=?]', expected
  end
end
