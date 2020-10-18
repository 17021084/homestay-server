Rails.application.config.middleware.use OmniAuth::Builder do  
  provider :google_oauth2,
    ENV['GOOGLE_CLIENT_ID'],
    ENV['GOOGLE_SECRET'],
    {
    callback_path: '/auth/google_oauth2/callback',
    scope: "email"
    }
    
end