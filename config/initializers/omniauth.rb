require 'omniauth-google-oauth2'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, Rails.application.secrets.google_client_id, Rails.application.secrets.google_client_secret, {
    :scope => [ 'profile', 'drive' ],
    :image_aspect_ratio => "square",
    :image_size => 50,
    :access_type => "online"
  }
end
