module RailsStars
  class StarsController < ::ApplicationController
    def create
      star_giver = current_star_giver if respond_to? :current_star_giver
      if star_giver
        @star = star_giver.stars_given.
          where(star_receiver_type: params[:star][:star_receiver_type]).
          where(star_receiver_id: params[:star][:star_receiver_id]).
          first
      end
      if @star
        @star.update_attributes(rating: params[:star][:rating])
      else
        @star ||= Star.create(params[:star]) do |star|
          star.star_giver = star_giver if star_giver
        end
      end
      render :json => { rating: @star.rating, average: @star.star_receiver.star_average.to_i, count: @star.star_receiver.star_count }
    end
  end
end
