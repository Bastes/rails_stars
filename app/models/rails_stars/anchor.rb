module RailsStars
  class Anchor < ActiveRecord::Base
    self.table_name = 'rails_stars_anchors'

    attr_accessible :star_receiver, :star_receiver_id, :star_receiver_type

    has_many   :stars_received, class_name:  'RailsStars::Star'
    belongs_to :star_receiver,  polymorphic: true
  end
end
