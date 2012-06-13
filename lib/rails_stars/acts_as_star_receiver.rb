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

    def receive_stars rating = nil
      RailsStars::Star.create(:star_receiver => self, :rating => rating)
    end
  end
end

ActiveRecord::Base.send :include, RailsStars::ActsAsStarReceiver
