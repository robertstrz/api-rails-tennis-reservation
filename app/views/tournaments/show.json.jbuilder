json.extract! @tournament, :id, :title, :content, :from, :to, :contact, :author, :surface, :created_at, :updated_at
json.image_url @host_address + @tournament.image.url
