Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = true

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  # Asset digests allow you to set far-future HTTP expiration dates on all assets,
  # yet still be able to expire them through the digest params.
  config.assets.digest = true

  # Adds additional error checking when serving assets at runtime.
  # Checks for improperly declared sprockets dependencies.
  # Raises helpful error messages.
  config.assets.raise_runtime_errors = true

  # config.action_mailer.delivery_method = :letter_opener
  
  provider  = (ENV["SMTP_PROVIDER"] || "SENDGRID").to_s
  address   = ENV["#{provider}_ADDRESS"] || "smtp.sendgrid.net"
  # if you use SES as your SMTP provider, then your username and password are actually your AWS credentials.
  user_name = ENV["#{provider}_USERNAME" || (provider == "SES" ? (ENV["AWS_ACCESS_KEY_ID"] || ENV["ACCESS_KEY_ID"] ) : nil) ]  # for AWS SES, this is your access key id
  password  = ENV["#{provider}_PASSWORD" || (provider == "SES" ? (ENV["AWS_SECRET_ACCESS_KEY"] || ENV["SECRET_ACCESS_KEY"] ) : nil) ]  # for AWS SES, this is your secret access key 
  domain    = ENV["#{provider}_DOMAIN"] || "heroku.com"

  ActionMailer::Base.smtp_settings = {
    :address        => address,
    :port           => '587',
    :authentication => :plain,
    :user_name      => user_name,
    :password       => password,
    :domain         => domain,
    :enable_starttls_auto => true
  }

  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true

  # Set host to localhost specifically to override AppSetting
  Rails.application.routes.default_url_options = { host: ENV['HOST'] }
end
