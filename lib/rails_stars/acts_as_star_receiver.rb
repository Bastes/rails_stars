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
      stars_received.average :rating
    end
  end
end

ActiveRecord::Base.send :include, RailsStars::ActsAsStarReceiver
