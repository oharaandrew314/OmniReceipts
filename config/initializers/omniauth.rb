require 'omniauth-google-oauth2'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, Figaro.env.google_client_id, Figaro.env.google_client_secret, {
    :scope => [ 'profile', 'drive' ],
    :image_aspect_ratio => "square",
    :image_size => 50,
    :access_type => "online"
  }
end
