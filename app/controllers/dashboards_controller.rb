class DashboardsController < ApplicationController
  def show
    @mysessions = Session.where(user: current_user)
    @sessions = UserInvite.where(user: current_user).map{|ui| ui.session}
    @alls = @mysessions + @sessions
    @inprogresssessions = @alls.select {|session| session.status == "in progress"}
  end
end
