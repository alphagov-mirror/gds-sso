GDS::SSO.config do |config|
  config.user_model   = "User"
  config.oauth_id     = "gds-sso-test"
  config.oauth_secret = "secret"
  config.oauth_root_url = "http://localhost:4567"
end
