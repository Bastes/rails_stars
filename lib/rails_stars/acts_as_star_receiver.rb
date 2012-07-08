module RailsStars
  module ActsAsStarReceiver
    extend ActiveSupport::Concern

    included do
    end

    module ClassMethods
      def receives_stars options = {}
        self.has_many :stars_received, :class_name => 'RailsStars::Star', :as => :star_receiver
      end
    end

    def receive_stars args = {}
      RailsStars::Star.create :star_receiver => self, :rating => args[:rating], :star_giver => args[:giver]
    end

    def star_average
      if stars_received.loaded?
        if stars_received.empty?
          0.0
        else
          stars_received.inject(0.0) { |r, i| r + i.rating } / stars_received.length
        end
      else
        stars_received.average :rating
      end
    end

    def star_count
      if stars_received.loaded?
        stars_received.length
      else
        stars_received.count
      end
    end
  end
end

ActiveRecord::Base.send :include, RailsStars::ActsAsStarReceiver
