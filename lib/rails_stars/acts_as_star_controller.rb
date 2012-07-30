module RailsStars
  module ActsAsStarController
    extend ActiveSupport::Concern

    module ClassMethods
      def grants_stars options = {}
        define_method :stars do
          options[:to].find(params[:id]).receive_stars params[:rating]
        end
      end
    end
  end
end

ActionController::Base.send :include, RailsStars::ActsAsStarController
