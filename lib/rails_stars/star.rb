module RailsStars
  class Star < ActiveRecord::Base
    self.table_name = 'rails_stars_stars'

    attr_accessible :star_receiver, :star_giver, :rating

    belongs_to :star_receiver, :polymorphic => true

    before_save :set_zero_rating_for_nil

    def set_zero_rating_for_nil
      self.rating ||= 0
    end
  end
end
