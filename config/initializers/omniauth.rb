Rails.application.config.middleware.use OmniAuth::Builder do

  scope = ["profile",
           "email",
           "https://www.googleapis.com/auth/plus.login"]

  provider :google_oauth2, ENV["GOOGLE_ID"], ENV["GOOGLE_SECRET"], {
    :name => "google",
    :scope => scope,
    :prompt => "consent",
    :image_aspect_ratio => "square",
    :image_size => 50,
    :access_type => 'offline'
  }
end
