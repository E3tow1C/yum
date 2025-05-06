Rails.application.config.middleware.use OmniAuth::Builder do
  provider :keycloak_openid,
    ENV["KEYCLOAK_CLIENT_ID"],
    ENV["KEYCLOAK_CLIENT_SECRET"],
    scope: "openid",
    client_options: {
      base_url: "",
      site: ENV["KEYCLOAK_SITE"],
      realm: ENV["KEYCLOAK_REALM"]
    },
    name: "keycloak_openid"
end

# Prevent OmniAuth from using /auth/failure for failed authentication
OmniAuth.config.on_failure = proc { |env|
  OmniAuth::FailureEndpoint.new(env).redirect_to_failure
}
