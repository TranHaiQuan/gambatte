class MessagesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :destroy]
  def new; end

  def create
    message = current_user.messages.build message_params
    if message.save
      ActionCable.server.broadcast "messages", message: message.content, user: message.user.name
      head :ok
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :chatroom_id)
  end
end
