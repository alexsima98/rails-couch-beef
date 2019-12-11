class SessionsController < ApplicationController
  def show
    @sessions = Session.find(params[:id])
  end

  def new
    @session = Session.new
    @lobby = Lobby.find(params[:lobby_id])
  end

  def create
    @session = Session.new(session_params)
    @session.user = current_user
    if @session.save
      redirect_to lobby_session(@session)
    else
      render :new
    end
  end

  def destroy
  end

  private

  def session_params
    params.require(:session).permit(:price, :win_price, :platform)
  end
end
