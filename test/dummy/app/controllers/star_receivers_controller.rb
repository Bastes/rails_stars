class StarReceiversController < ApplicationController
  def index
    @star_receivers = StarReceiver.all
  end

  def stars
  end
end
