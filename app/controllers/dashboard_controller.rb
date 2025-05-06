class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    # Only accessible to authenticated users
  end
end
