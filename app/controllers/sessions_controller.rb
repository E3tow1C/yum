class SessionsController < ApplicationController
  before_action :authenticate_user!, only: [ :sign_out_keycloak_success ]

  def create
    auth = request.env["omniauth.auth"]
    user = User.from_omniauth(auth)
    id_token = auth.extra.id_token if auth.extra

    session[:id_token] = id_token
    session[:user_id] = user.id
    # assuming the user has role "admin_director", but this should be returned from Keycloak
    session[:role] = "admin_director"

    redirect_to root_path, notice: "Signed in successfully!"
  end

  def destroy
    front_channel_logout_url = ENV["KEYCLOAK_END_SESSION_URI"] + "?post_logout_redirect_uri=#{ENV['REDIRECT_AFTER_SIGN_OUT_URI']}&id_token_hint=#{session[:id_token]}"
    redirect_to front_channel_logout_url, allow_other_host: true
  end

  def sign_out_keycloak_success
    session.delete :id_token
    session.delete :user_id
    session.delete :role
    reset_session

    redirect_to root_path, notice: "You have been signed out."
  end

  def failure
    redirect_to root_path, alert: "Authentication failed: #{params[:message]}"
  end
end
