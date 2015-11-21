json.current_station @nearest_station.code

json.offers @response_body.take(2).each do |r|
  json.origin r['origins'].first['stationCode']
  json.destination r['destinations'].first['stationCode']
  json.platform r['platform']
  json.estimatedDepartureTime r['estimatedDepartureTime']
  json.estimatedArrivalTime r['estimatedArrivalTime']
  json.scheduledArrivalTime r['scheduledArrivalTime']
end
