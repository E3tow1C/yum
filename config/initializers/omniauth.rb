Rails.application.config.middleware.use OmniAuth::Builder do
  provider :keycloak_openid, ENV["KEYCLOAK_CLIENT_ID"], ENV["KEYCLOAK_CLIENT_SECRET"],
    client_options: { site: ENV["KEYCLOAK_SITE"], realm: ENV["KEYCLOAK_REALM"] },
    name: "keycloak"
end

# Prevent OmniAuth from using /auth/failure for failed authentication
OmniAuth.config.on_failure = proc { |env|
  OmniAuth::FailureEndpoint.new(env).redirect_to_failure
}
