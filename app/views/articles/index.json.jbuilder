json.array!(@articles) do |article|
  json.extract! article, :id, :title, :content, :author
  json.image_url @host_address + article.image.url
end
