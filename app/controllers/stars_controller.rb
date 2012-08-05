module RailsStars
  class StarsController < ::ApplicationController
    def create
      @receiver = Star.create(params[:star]).receiver
      render :json => { rating: params[:rating], average: @receiver.star_average.to_i }
    end
  end
end
