module RailsStars
  # Controller handling the star ratings creation or update
  #
  # If you want the votes to be expressed on a per-user basis, you need to
  # give your ApplicationController a .current_star_giver method that
  # returns the current user, or either nil (to allow to rate anonymously)
  # or false (to prevent it).
  #
  # @example Logged users can rate, others can't
  #   class ApplicationController < ActionController::Base
  #     # ...
  #     def current_star_giver
  #       current_user || false
  #     end
  #     # ...
  #   end
  class StarsController < ::ApplicationController

    # Creates a star model
    #
    # POST /rails_stars/stars
    def create
      star_giver = current_star_giver if respond_to? :current_star_giver
      if star_giver == false
        render nothing: true, status: :unauthorized
      else
        if star_giver
          @star = star_giver.stars_given.
            where(anchor_id: params[:star][:anchor_id]).
            first
        end
        if @star
          @star.update_attributes(rating: params[:star][:rating])
        else
          @star ||= Star.create(params[:star]) do |star|
            star.star_giver = star_giver if star_giver
          end
        end
        render :json => { rating: @star.rating, average: @star.anchor.star_receiver.star_average.to_i, count: @star.anchor.star_receiver.star_count }
      end
    end
  end
end
