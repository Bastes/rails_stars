module RailsStars
  class Star < ActiveRecord::Base
    set_table_name 'rails_stars_stars'

    attr_accessible :star_receiver, :star_giver, :rating

    belongs_to :star_receiver, :polymorphic => true
  end
end
