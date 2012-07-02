module RailsStars
  module Helper
    def stars_for receiver
      content_tag(:div, '', {
        :"data-stars-for" => send(:"stars_#{receiver.class.name.underscore}_url", :id => receiver),
        :"data-stars-average" => (receiver.star_average || 0).round,
        :"data-stars-count" => receiver.stars_received.count
      })
    end
  end
end

ActionView::Base.send :include, RailsStars::Helper
