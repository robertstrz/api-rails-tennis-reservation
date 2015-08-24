json.array!(@userreservations) do |reservation|
  json.id reservation.id
  json.time_from reservation.time_from.strftime("%H:%M")
  json.time_to reservation.time_to.strftime("%H:%M")
  json.date reservation.time_to.strftime("%A %d of %B")
  json.court_number Court.find_by(id: reservation.court_id).court_number
end