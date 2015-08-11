json.array!(@tournaments) do |tournament|
  json.extract! tournament, :id, :title, :content, :from, :to, :contact, :author, :surface, :city
  json.image_url "http://0.0.0.0:3000" + tournament.image.url
end
