require 'test_helper'

class ActsAsStarGiverTest < ActiveSupport::TestCase
  setup do
    @star_receiver = StarReceiver.create
    @star_giver = StarGiver.create
  end

  test 'You can give stars when your class gives_stars' do
    assert_difference '@star_giver.stars_given.count' do
      @star_giver.give_stars @star_receiver
    end
  end

  test 'You can give rated stars' do
    @star_giver.give_stars @star_receiver, rating: 3
    assert_equal 3, @star_receiver.stars_received.first.rating
  end
end