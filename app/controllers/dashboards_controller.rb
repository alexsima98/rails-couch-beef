class DashboardsController < ApplicationController
  def show
    @mysessions = Session.where(user: current_user)
    @sent_invites = UserInvite.where(user: current_user).where(status: "Pending").select{|ui| ui.session.user_id == current_user.id}.map { |ui| ui.session }
    @received_invites = UserInvite.where(user: current_user).where(status: "Pending").select{|ui| ui.session.user_id != current_user.id}.map { |ui| ui.session }
    @accepted_sessions = UserInvite.where(user: current_user).where(status: "accepted").map { |ui| ui.session }
    @alls = @mysessions + @accepted_sessions
    @inprogresssessions = @alls.select { |session| session.status == "in progress" || session.status == "finished" }
    @finished_sessions = @alls.select { |session| session.status == "agreed" }
  end
end
