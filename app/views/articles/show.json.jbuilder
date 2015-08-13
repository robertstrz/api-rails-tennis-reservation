json.extract! @article, :id, :title, :content, :author, :created_at, :updated_at
json.image_url @host_address + @article.image.url

