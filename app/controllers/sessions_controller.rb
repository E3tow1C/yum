class SessionsController < ApplicationController
  def create
    auth = request.env["omniauth.auth"]
    user = User.from_omniauth(auth)

    if user
      session[:user_id] = user.id
      redirect_to dashboard_path, notice: "Signed in successfully."
    else
      redirect_to root_path, alert: "Failed to sign in."
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Signed out successfully!"
  end

  def failure
    redirect_to root_path, alert: "Authentication failed: #{params[:message]}"
  end
end
