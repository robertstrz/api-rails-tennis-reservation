json.array!(@reservations) do |reservation|
  json.extract! reservation, :id, :court, :time_from, :time_to
  json.url reservation_url(reservation, format: :json)

  json.user_data do
    json.id reservation.user.id
    json.email reservation.user.email
  end
end
