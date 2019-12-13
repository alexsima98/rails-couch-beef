class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)
    @message.user = current_user
    @message.session = @session
    if @message.save
      redirect_to redirect_back(fallback_location: lobbies_index)
    end
  end

   private

  def message_params
    params.require(:message).permit(:content, :user)
  end
end
