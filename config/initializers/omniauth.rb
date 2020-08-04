Rails.application.config.middleware.use OmniAuth::Builder do
  if Rails.env.development? || Rails.env.test?
    provider :github, ENV["GITHUB_ID"], ENV["GITHUB_SECRET"]
  end
end
