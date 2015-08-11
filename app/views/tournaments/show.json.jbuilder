json.extract! @tournament, :id, :title, :content, :from, :to, :contact, :author, :surface, :created_at, :updated_at
json.image_url "http://0.0.0.0:3000" + @tournament.image.url
