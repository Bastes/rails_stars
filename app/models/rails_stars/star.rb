module RailsStars
  class Star < ActiveRecord::Base
    self.table_name = 'rails_stars_stars'

    attr_accessible :star_receiver, :star_receiver_id, :star_receiver_type, :star_giver, :rating

    belongs_to :star_receiver, :polymorphic => true
    belongs_to :star_giver, :polymorphic => true

    before_save :set_zero_rating_for_nil

    scope :where_giver, lambda { |giver| where(star_giver_type: giver.class.to_s, star_giver_id: giver.id) }
    scope :where_receiver, lambda { |receiver| where(star_receiver_type: receiver.class.to_s, star_receiver_id: receiver.id) }

    def set_zero_rating_for_nil
      self.rating ||= 0
    end
  end
end
