OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '120570751873685', '7eb5019fd555a8b82f60512ab03e32bd'
end