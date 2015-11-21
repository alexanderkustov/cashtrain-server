json.current_station @nearest_station.code
json.offerPoints @offer.points
json.trains @response_body.take(2).each do |r|
  json.serviceId r['serviceId']
  json.origin r['origins'].first['stationCode']
  json.destination r['destinations'].first['stationCode']
  json.estimatedDepartureTime r['estimatedDepartureTime']
  json.estimatedArrivalTime r['estimatedArrivalTime']
  json.scheduledArrivalTime r['scheduledArrivalTime']
  json.platform r['platform']
  json.overcrowdingIndex 0
end
