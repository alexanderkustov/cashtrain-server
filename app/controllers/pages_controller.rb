class PagesController < ApplicationController
  def index
    @stations = Station.all
    @feedback = Feedback.all
    @offers = Offer.all

    @hash = Gmaps4rails.build_markers(@stations) do |station, marker|
      marker.lat station.latitude
      marker.lng station.longitude
      # marker.picture({
      #  "url" => '/circle.png',
      #  "width" => 16,
      #  "height" => 16
      #   })
      marker.infowindow station.name
    end
  end
end
