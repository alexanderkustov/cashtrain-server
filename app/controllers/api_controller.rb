class ApiController < ApplicationController
  include HTTParty
  protect_from_forgery only: []

  def stations
    @stations = Station.all
    render 'self', content_type: Mime::JSON
  end

  def possibleTravellingTrains
    nearest_station = Station.near([params[:latitude].to_s, params[:longitude].to_s], 5).first
    #dev hack
    if Rails.env.development?
      params[:destination] = "YRK"
      nearest_station.code = "KGX"
    end

    @response = self.class.get(URI.encode("http://darwin.hacktrain.com/api/train/#{params[:destination]}/from/#{nearest_station.code}?apiKey=b55bbec8-81d3-4ba5-8626-c1c7568a8106&rows=10"))
    render json: @response.body
  end

  def possibleOffers
    @nearest_station = Station.near([params[:latitude].to_s, params[:longitude].to_s], 5).first
    @offer = Offer.first
    #dev hack
    if Rails.env.development?
      params[:destination] = "YRK"
      @nearest_station.code = "KGX"
    end
    @response = self.class.get(URI.encode("http://darwin.hacktrain.com/api/train/#{params[:destination]}/from/#{@nearest_station.code}?apiKey=b55bbec8-81d3-4ba5-8626-c1c7568a8106&rows=10"))
    @response_body = JSON.parse(@response.body)
    render 'possible_offers', content_type: Mime::JSON
  end

  #POST
  def offers
    Offer.create(permitted_params)
    render json: "success"
  end

  def overcrowding
     Feedback.create(feedback_params)
     render json: "Feedback Recorded"
  end

  protected
    def permitted_params
      params.permit(:train_id, :latitude, :longitude)
    end

    def feedback_params
      params.permit(:train_id, :feedback)
    end
end
