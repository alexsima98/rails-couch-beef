class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)
    @message.user = current_user
    @session = Session.find(params[:session_id])
    @message.session = @session
    @lobby = @session.lobby
    if @message.save
      redirect_to lobby_session_path(@lobby, @session)
    else
      render "sessions/show"
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
