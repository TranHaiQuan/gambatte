class ChatroomsController < ApplicationController
  before_action :chatroom, only: [:show, :edit, :update]
  def show
    @message = Message.new
  end

  def index
    @chatrooms = Chatroom.all
  end

  def new
    @chatroom = Chatroom.new
  end

  def create
    @chatroom = Chatroom.new chatroom_params
    if @chatroom.save
      respond_to do |format|
        format.html {redirect_to @chatroom}
        format.js
      end
    else
      # respond_to do |format|
      #   flash[:danger] = "A chatroom existed. You should create by another name :)"
      #   format.html {redirect_to new_chatroom_path}
      #   format.js {render template: "chatrooms/chatroom_error.js.erb"}
      # end
    end
    @chatroom.slug = params[:slug]
    @chatroom.save
  end

  private

  def chatroom_params
    params.require(:chatroom).permit :topic, :slug
  end

  def chatroom
    @chatroom = Chatroom.find_by slug: params[:slug]
  end
end
