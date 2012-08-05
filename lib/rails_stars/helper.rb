module RailsStars
  module Helper
    def stars_for receiver
      form_for(RailsStars::Star.new(star_receiver: receiver),
               :"data-stars-average" => (receiver.star_average || 0).round,
               :"data-stars-count" => receiver.star_count) do |f|
        f.hidden_field(:star_giver_id)
        f.hidden_field(:star_giver_type)
        f.hidden_field(:rating)
      end
    end
  end
end

ActionView::Base.send :include, RailsStars::Helper
