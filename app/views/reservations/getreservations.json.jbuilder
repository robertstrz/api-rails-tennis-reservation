json.extract! @city, :id, :name
json.reservation_day @reservationDay
json.reservation_pretty @reservationDay.strftime("%A %d of %B")
json.courts do
  json.array!(@city.court.order(:court_number)) do |court|
    json.id court.id
    json.court_number court.court_number
    json.surface court.surface

    json.reservations @getreservations.where(court_id: court.id).order(time_from: :desc) do |reservation|
      json.id reservation.id
      json.court_id reservation.court_id
      json.user_id reservation.user_id
      json.time_from reservation.time_from
      json.time_to reservation.time_to
    end
  end
end
