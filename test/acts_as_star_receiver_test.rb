require 'test_helper'

class ActsAsStarReceiverTest < ActiveSupport::TestCase
  setup do
    @star_receiver = StarReceiver.create
  end

  test 'You can receive stars when your class receives_stars' do
    assert_difference '@star_receiver.stars_received.count' do
      @star_receiver.receive_stars
    end
  end

  test 'You can receive rated stars' do
    @star_receiver.receive_stars 5
    assert_equal 5, @star_receiver.stars_received.first.rating
  end

  test 'If un-rated, stars get a 0 default rating' do
    @star_receiver.receive_stars
    assert_equal 0, @star_receiver.stars_received.first.rating
  end
end
