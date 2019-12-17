class UserInvitesController < ApplicationController
  def create
    @lobby = Lobby.find(params[:lobby_id])
    @session = Session.find(params[:session_id])
    @user_invite = UserInvite.new
    @user_invite.user = User.find(params[:user_invite][:user].to_i)
    @user_invite.session = @session
    @user_invite.save
    redirect_to lobby_session_path(@lobby, @session)
  end

  def accept

  end
end
