module RailsStars
  class Star < ActiveRecord::Base
    self.table_name = 'rails_stars_stars'

    attr_accessible :anchor, :anchor_id, :star_giver, :rating

    belongs_to :star_giver,    polymorphic: true
    belongs_to :anchor,        class_name:  'RailsStars::Anchor'

    delegate :star_receiver, to: :anchor, allow_nil: true

    before_save :set_zero_rating_for_nil

    scope :where_giver, ->(giver) {
      where(star_giver_type: giver.class.to_s, star_giver_id: giver.id) }
    scope :where_receiver, ->(receiver) {
      includes(:anchor).
      where(rails_stars_anchors: {
        star_receiver_type: receiver.class.to_s,
        star_receiver_id: receiver.id}) }

    def set_zero_rating_for_nil
      self.rating ||= 0
    end
  end
end
