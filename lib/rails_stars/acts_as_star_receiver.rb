module RailsStars
  # Allows an ActiveRecord object to receive star ratings
  module ActsAsStarReceiver
    extend ActiveSupport::Concern

    module ClassMethods
      # Grants a model the ability to recive star ratings
      def receives_stars options = {}
        self.has_one  :stars_anchor,   class_name: 'RailsStars::Anchor', as:      :star_receiver
        self.has_many :stars_received, class_name: 'RailsStars::Star',   through: :stars_anchor
      end
    end

    # Receives a star rating
    #
    # @option options [Integer] rating the number of stars received
    # @option options [Object] giver the object giving the rating
    #
    # @return [RailsStars::Star] the star object created
    def receive_stars options = {}
      RailsStars::Star.create :anchor => stars_anchor!, :rating => options[:rating], :star_giver => options[:giver]
    end

    # Current star rating average
    #
    # @return [Numeric] star rating average
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

    # Current star count
    #
    # @return [Integer] star count
    def star_count
      if stars_received.loaded?
        stars_received.length
      else
        stars_received.count
      end
    end

    def stars_anchor!
      if stars_anchor
        stars_anchor
      else
        stars_anchor = create_stars_anchor
      end
    end
  end
end

ActiveRecord::Base.send :include, RailsStars::ActsAsStarReceiver
