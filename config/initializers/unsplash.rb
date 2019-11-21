Unsplash.configure do |config|
  config.application_access_key = ENV["UNSPLASH_KEY"]
  config.application_secret = ENV["UNSPLASH_SECRET"]
  config.application_redirect_uri = "urn:ietf:wg:oauth:2.0:oob"
  config.utm_source = "automation_hub"

  # optional:
  # config.logger = MyCustomLogger.new
end
