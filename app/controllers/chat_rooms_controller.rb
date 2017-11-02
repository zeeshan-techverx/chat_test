class ChatRoomsController < ApplicationController

  def index
    @chat_rooms = ChatRoom.by_user(current_user.id)
  end

  def new
    @chat_room = ChatRoom.new
    @users = User.except(current_user)
  end

  def create
    @chat_room = current_user.chat_rooms.build(chat_room_params)
    if @chat_room.save
      flash[:success] = 'Chat room added!'
      redirect_to chat_rooms_path
    else
      render 'new'
    end
  end

  def show
  	@chat_room = ChatRoom.includes(:messages).find_by(id: params[:id])
    @message = Message.new
  end

  private

  def chat_room_params
    params.require(:chat_room).permit(:title, :receiver_id)
  end
end
