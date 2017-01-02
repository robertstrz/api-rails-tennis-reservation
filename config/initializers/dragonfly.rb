require 'dragonfly'

# Configure
Dragonfly.app.configure do
  plugin :imagemagick

  secret "HAHA ;)"

  url_format "/media/:job/:name"

  if Rails.env.development? || Rails.env.test?
    datastore :file,
              root_path: Rails.root.join('public/system/dragonfly', Rails.env),
              server_root: Rails.root.join('public')
  else
    datastore :s3,
              bucket_name: 'myrailscontainer',
              access_key_id: 'HAHA ;)',
              secret_access_key: 'HAHA ;)',
              url_scheme: 'https'
  end

end

# Logger
Dragonfly.logger = Rails.logger

# Mount as middleware
Rails.application.middleware.use Dragonfly::Middleware

# Add model functionality
if defined?(ActiveRecord::Base)
  ActiveRecord::Base.extend Dragonfly::Model
  ActiveRecord::Base.extend Dragonfly::Model::Validations
end
