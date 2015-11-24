Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :twitter, "7S5dMamegpntDA6zfm3XQEYsW", "N6lWaZHA8gPeKhuwkonrYyILz7ZuYGCD4CWq6lM5BRDozJ2TaO"
end
