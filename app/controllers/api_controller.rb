class ApiController < ApplicationController
  def stations
    @stations = Station.all
    #render json: @stations
    render 'self', content_type: Mime::JSON

  end
end
