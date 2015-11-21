class ApiController < ApplicationController
  include HTTParty
  base_uri "http://darwin.hacktrain.com/api/train"
  protect_from_forgery only: []

  def stations
    @stations = Station.all
    #render json: @stations
    render 'self', content_type: Mime::JSON
  end

  def possibleTravellingTrains
    nearest_station = Station.near([params[:latitude].to_s, params[:longitude].to_s], 5).first
    @response = self.class.get(URI.encode("http://darwin.hacktrain.com/api/train/#{nearest_station.code}/from?apiKey=b55bbec8-81d3-4ba5-8626-c1c7568a8106&rows=10"))
    render json: @response.body
  end

  def possibleOffers
    @nearest_station = Station.near([params[:latitude].to_s, params[:longitude].to_s], 5).first

    if Rails.env.development?
      params[:destination] = "YRK"
      @nearest_station.code = "KGX"
    end

    @response = self.class.get(URI.encode("http://darwin.hacktrain.com/api/train/#{params[:destination]}/from/#{@nearest_station.code}?apiKey=b55bbec8-81d3-4ba5-8626-c1c7568a8106&rows=10"))
    #render json: @response.body
    @response_body = JSON.parse(@response.body)
    render 'possible_offers', content_type: Mime::JSON

  end

  def overcrowding
    Feedback.new(train_id: "#{params[:train_id]}", feedback: "#{params[:feedback]}")
    render json: "Feedback Recorded"
  end

  def offers
    # Offer.create( train_id: params[:service_id], latitude:[params[:latitude].to_s, longitude: params[:longitude].to_s)
  end
end
