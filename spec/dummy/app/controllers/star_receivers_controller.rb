class StarReceiversController < ApplicationController
  def index
    @star_receivers = StarReceiver.includes(:stars_received).all
  end

  def stars
    @star_receiver = StarReceiver.find(params[:id])
    @star_receiver.receive_stars rating: params[:rating]
    render :json => { rating: params[:rating], average: @star_receiver.star_average.to_i }
  end
end
