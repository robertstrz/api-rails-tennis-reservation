json.array!(@tournaments) do |tournament|
  json.extract! tournament, :id, :title, :content, :from, :to, :contact, :author, :surface, :city
  json.image_url @host_address + tournament.image.url
end
