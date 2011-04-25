Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '198562723513015', '722a37daa63dfe8c8d82b99fececed97'
end