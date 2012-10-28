module RailsStars
  # The RailsStars::Helper mixes in ActionView::Base to give the stars_for
  # method that displays stars ratings and let visitors click on to give
  # their own rating.
  module Helper
    # Displays a rating form for a star receiver
    #
    # @param [Object] receiver the receiver to attach stars to
    def stars_for receiver
      form_for([rails_stars, RailsStars::Star.new(star_receiver: receiver)], html: {
               :"data-stars-average" => (receiver.star_average || 0).round,
               :"data-stars-count" => receiver.star_count}) do |f|
        [
          f.hidden_field(:star_receiver_id),
          f.hidden_field(:star_receiver_type),
          f.hidden_field(:rating)
        ].join.html_safe
      end
    end
  end
end

ActionView::Base.send :include, RailsStars::Helper
