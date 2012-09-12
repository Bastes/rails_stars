module RailsStars
  class StarsController < ::ApplicationController
    def create
      @star = Star.create(params[:star])
      render :json => { rating: @star.rating, average: @star.star_receiver.star_average.to_i, count: @star.star_receiver.star_count }
    end
  end
end
