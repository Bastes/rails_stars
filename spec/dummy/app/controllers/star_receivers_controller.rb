class StarReceiversController < ApplicationController
  def index
    @star_receivers = StarReceiver.includes(:stars_received).all
  end
end
