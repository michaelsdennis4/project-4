require 'dragonfly'

# Configure
Dragonfly.app.configure do
  plugin :imagemagick

  secret "110c31b6cc79ecbd8faf339f58fef6732a16a71e2bc237ac4ddcd7b1091ea533"

  url_format "/media/:job/:name"

  datastore :file,
    root_path: Rails.root.join('public/system/dragonfly', Rails.env),
    server_root: Rails.root.join('public')
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
