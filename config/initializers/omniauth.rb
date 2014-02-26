Rails.application.config.middleware.use OmniAuth::Builder do
  secrets = Rails.application.secrets

  provider :developer unless Rails.env.production?
  provider :github, secrets.github_key, secrets.github_secret
end
