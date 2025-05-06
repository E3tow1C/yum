Rails.application.config.middleware.use OmniAuth::Builder do
  provider :keycloak_openid,
    ENV["KEYCLOAK_CLIENT_ID"],
    ENV["KEYCLOAK_CLIENT_SECRET"],
    name: "keycloak_openid",
    client_options: {
      base_url: "",
      site: ENV["KEYCLOAK_SITE"],
      realm: ENV["KEYCLOAK_REALM"],
      authorize_url: "/auth/realms/#{ENV["KEYCLOAK_REALM"]}/protocol/openid-connect/auth",
      token_url: "/auth/realms/#{ENV["KEYCLOAK_REALM"]}/protocol/openid-connect/token",
      userinfo_url: "/auth/realms/#{ENV["KEYCLOAK_REALM"]}/protocol/openid-connect/userinfo"
    }
end

# Prevent OmniAuth from using /auth/failure for failed authentication
OmniAuth.config.on_failure = proc { |env|
  OmniAuth::FailureEndpoint.new(env).redirect_to_failure
}
