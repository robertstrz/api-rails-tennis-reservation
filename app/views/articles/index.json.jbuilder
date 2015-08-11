json.array!(@articles) do |article|
  json.extract! article, :id, :title, :content, :author
  json.image_url "http://0.0.0.0:3000" + article.image.url
end
