class ApiController < ApplicationController
  include HTTParty
  base_uri "http://darwin.hacktrain.com/api/train"

  def stations
    @stations = Station.all
    #render json: @stations
    render 'self', content_type: Mime::JSON
  end

  def possibleTravellingTrains
    nearest_station = Station.near([params[:latitude].to_s, params[:longitude].to_s], 5).first
    @response = self.class.get(URI.encode("http://private-anon-822f69e37-darwinrest.apiary-mock.com/api/train/#{nearest_station.code}/from?apiKey=b55bbec8-81d3-4ba5-8626-c1c7568a8106&rows=10") )
    render json:  @response.body
  end
end
