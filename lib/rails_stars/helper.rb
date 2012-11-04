module RailsStars
  # The RailsStars::Helper mixes in ActionView::Base to give the stars_for
  # method that displays stars ratings and let visitors click on to give
  # their own rating.
  module Helper
    # Displays a rating widget for a star receiver
    #
    # @param [Object] receiver the receiver
    def stars_form_for receiver
      form_for([rails_stars, RailsStars::Star.new(star_receiver: receiver)], html: {
               :"data-stars-average" => rounded_star_average(receiver),
               :"data-stars-count" => receiver.star_count,
               :id => nil}) do |f|
        [
          f.hidden_field(:star_receiver_id),
          f.hidden_field(:star_receiver_type),
          f.hidden_field(:rating)
        ].join.html_safe
      end
    end

    # Displays a rating form for a star receiver
    #
    # @param [Object] receiver the receiver
    def stars_for receiver
      "#{rounded_star_average(receiver)} / #{receiver.star_count}"
    end

    # Rounds the stars average of a receiver for display
    #
    # @param [Object] receiver the receiver
    def rounded_star_average receiver
      '%.1f' % (receiver.star_average || 0)
    end
  end
end

ActionView::Base.send :include, RailsStars::Helper
