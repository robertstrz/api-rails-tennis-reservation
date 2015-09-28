json.array!(@articles) do |article|
  json.extract! article, :id, :title, :author
  json.content truncate(article.content, length: 50)
  json.image_url @host_address + article.image.url
end
