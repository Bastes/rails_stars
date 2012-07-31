module RailsStars
  class StarsController < ActionController::Base
    def create
      receiver.receive_stars params[:rating]
    end

    private

    def receiver_key
      @receiver_key ||= params.keys.grep(/_id\Z/).first
    end

    def receiver_model
      @receiver_model ||= receiver_key.to_s[/\A(.*)_id\Z/, 1].classify.constantize
    end

    def receiver
      receiver_model.find(receiver_key)
    end
  end
end
