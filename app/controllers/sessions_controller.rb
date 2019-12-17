class SessionsController < ApplicationController
  def show
    @lobby = Lobby.find(params[:lobby_id])
    @session = Session.find(params[:id])
    @user_invite = UserInvite.new
    @users = User.all
  end

  def new
    @session = Session.new
    @lobby = Lobby.find(params[:lobby_id])
  end

  def create
    @session = Session.new(session_params)
    @lobby = Lobby.find(params[:lobby_id])
    @session.user = current_user
    @session.lobby = @lobby
    if @session.save

      redirect_to lobby_session_path(@lobby, @session)
    else
      render :new
    end
  end

  def destroy
    @session = Session.find(params[:id])
    @session.destroy
    redirect_to lobby_path(@session.lobby)
  end

  def joining_session
    @session = Session.find(params[:session_id])
    @lobby = Lobby.find(@session.lobby_id)
    current_user.wallet -= @session.price
    @session.win_price += @session.price
    current_user.save!

    redirect_to lobby_session_path(@lobby, @session)
  end

  private

  def session_params
    params.require(:session).permit(:price, :win_price, :platform)
  end
end
