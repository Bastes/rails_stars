module RailsStars
  module Helper
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
