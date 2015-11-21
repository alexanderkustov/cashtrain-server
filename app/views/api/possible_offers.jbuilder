json.current_station @nearest_station.code
json.offerPoints @offer.points
json.nextTrain do
  json.serviceId @response_body.take(2).first['serviceId']
  json.origin @response_body.take(2).first['origins'].first['stationCode']
  json.destination @response_body.take(2).first['destinations'].first['stationCode']
  json.estimatedDepartureTime @response_body.take(2).first['estimatedDepartureTime']
  json.estimatedArrivalTime @response_body.take(2).first['estimatedArrivalTime']
  json.scheduledArrivalTime @response_body.take(2).first['scheduledArrivalTime']
  json.platform @response_body.take(2).first['platform']
  json.overcrowdingIndex crowd_index(@response_body.take(2).first['serviceId'])
end
json.uncrowdedTrain do
  json.serviceId @response_body.take(2).last['serviceId']
  json.origin @response_body.take(2).last['origins'].first['stationCode']
  json.destination @response_body.take(2).last['destinations'].first['stationCode']
  json.estimatedDepartureTime @response_body.take(2).last['estimatedDepartureTime']
  json.estimatedArrivalTime @response_body.take(2).last['estimatedArrivalTime']
  json.scheduledArrivalTime @response_body.take(2).last['scheduledArrivalTime']
  json.platform @response_body.take(2).last['platform']
  json.overcrowdingIndex 1.5
end
