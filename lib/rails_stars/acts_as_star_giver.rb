module RailsStars
  # Allows an ActiveRecord object (often an user instance) to give star ratings
  module ActsAsStarGiver
    extend ActiveSupport::Concern

    module ClassMethods
      # Grants a model the ability to give star ratings to a receiver
      def gives_stars options = {}
        self.has_many :stars_given, :class_name => 'RailsStars::Star', :as => :star_giver
      end
    end

    # Gives a star rating to a receiver
    #
    # @param [Object] receiver the star receiver
    # @option options [Integer] rating the number of stars given
    #
    # @return [RailsStars::Star] the star object created
    def give_stars receiver, options = {}
      receiver.receive_stars options.merge(giver: self)
    end
  end
end

ActiveRecord::Base.send :include, RailsStars::ActsAsStarGiver

