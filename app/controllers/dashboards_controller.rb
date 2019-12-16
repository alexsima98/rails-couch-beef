class DashboardsController < ApplicationController
  def show
    @mysessions = Session.where(user: current_user)
    @sessions = Session.where(user_invites: current_user)
    @alls = @mysessions + @sessions
  end
end
