Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, "343784495811346", "b0cddc600182da7f9fda214411ec472a"
end