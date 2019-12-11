class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)
    @message.user = current_user
    @message.session = @session
    if @message.save
      redirect_to lobby_session(@lobby,@session)
    else
      render :new
    end
  end

   private

  def message_params
    params.require(:session).permit(:price, :win_price, :platform)
  end
end


  def create
    @session = Session.new(session_params)
    @session.user = current_user
    @session.lobby = @lobby
    if @session.save
      redirect_to lobby_session(@lobby,@session)
    else
      render :new
    end
  end
