require 'dragonfly'

# Configure
Dragonfly.app.configure do
  plugin :imagemagick

  secret "a994b02ae1cf8dbbaa452bcbfd292a15fcf6b9b6a7ed4f00bddec6da5357ccb6"

  url_format "/media/:job/:name"

  if Rails.env.development? || Rails.env.test?
    datastore :file,
              root_path: Rails.root.join('public/system/dragonfly', Rails.env),
              server_root: Rails.root.join('public')
  else
    datastore :s3,
              bucket_name: 'myrailscontainer',
              access_key_id: 'AKIAJJB7RDBTO2S4WR3A',
              secret_access_key: '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',
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
