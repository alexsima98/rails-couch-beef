class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)
    @message.user = current_user
    @message.session = @session
    if @message.save
      redirect_to lobby_session_path(@session, @message)
    end
  end

   private

  def message_params
    params.require(:message).permit(:content, :user)
  end
end
