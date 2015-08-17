json.array!(@courts) do |court|
  json.extract! court, :id, :city, :court_number, :surface
  json.url court_url(court, format: :json)
end
