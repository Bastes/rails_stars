module RailsStars
  module ActsAsStarGiver
    extend ActiveSupport::Concern

    included do
    end

    module ClassMethods
      def gives_stars options = {}
        self.has_many :stars_given, :class_name => 'RailsStars::Star', :as => :star_giver
      end
    end

    def give_stars receiver
      RailsStars::Star.create(:star_giver => self, :star_receiver => receiver)
    end
  end
end

ActiveRecord::Base.send :include, RailsStars::ActsAsStarGiver

