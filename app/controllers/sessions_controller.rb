class SessionsController < ApplicationController
  def show
    @sessions = Session.find(params[:id])
  end

  def new
    @session = Session.new
  end

  def create
    @session = Session.new(session_params)
    @session.user = current_user
    if @session.save
      redirect_to lobby_session(@session)
    else
      render :new
  end

  def destroy
  end

  private

  def session_params
    params.require(:session).permit(:price, :win_price, :platform)
  end
end
