json.stations @stations do |s|
  json.code s.code
  json.name s.name
  json.latitude s.latitude
  json.longitude s.longitude
end
