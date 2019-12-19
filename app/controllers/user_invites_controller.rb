class UserInvitesController < ApplicationController
  def create
    # MOVED THIS TO SESSIONS CONTROLLER INSIDE OF THE JOINING_SESSION

    @lobby = Lobby.find(params[:lobby_id])
    @session = Session.find(params[:session_id])
    @user_invite = UserInvite.new
    @user_invite.user = User.find(params[:user_invite][:user].to_i)
    @user_invite.session = @session
    @user_invite.save
    redirect_to lobby_session_path(@lobby, @session)
  end

  def destroy
    @user_invite = UserInvite.find(params[:id])
    @user_invite.destroy
  end

  def accept
    @session = Session.find(params[:session_id])
    @user_invite = UserInvite.find(params[:user_invite_id])
    @user_invite.status = 'accepted'
    @user_invite.save
    @session.status = 'in progress'
    @session.save
    @user_invite.user.wallet -= @session.price
    @user_invite.user.save
    redirect_to dashboard_path(current_user)
  end

  def decline
    @session = Session.find(params[:session_id])
    @user_invite = UserInvite.find(params[:user_invite_id])
    @user_invite.status = "declined"
    @user_invite.save
    redirect_to dashboard_path(current_user)
  end

  def cancel
    @session = Session.find(params[:session_id])
    @user_invite = UserInvite.find(params[:user_invite_id])
    @user_invite.user.wallet += @session.price
    @user_invite.user.save
    @user_invite.destroy
    redirect_to dashboard_path(current_user)
  end
end
