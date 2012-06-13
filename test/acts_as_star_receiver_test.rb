require 'test_helper'

class ActsAsStarReceiverTest < ActiveSupport::TestCase
  test 'You can receive stars when your class receives_stars' do
    star_receiver = StarReceiver.create
    assert_difference 'star_receiver.stars_received.count' do
      star_receiver.receive_stars
    end
  end
end
