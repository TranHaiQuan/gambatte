class FriendsController < ApplicationController
  before_action :load_friend, only: [:edit, :destroy, :update]

  def create
    @friend = User.find params[:format]
    @friendship = Friend.new user_id: current_user.id, friend_id: @friend.id
    # debugger
    # @friendship.friend_id = User.find(params[:format]).id
    if @friendship.save
      flash[:success] = "You was sent add friend request success!"
    else
      flash[:danger] = "You can't send add friend request!"
    end
  end

  def edit; end

  def update
    if @friendship.update_attributes friend_params
      flash[:success] = "ok done"
    else
      flash[:danger] = "false! leu leu"
    end
  end

  def destroy
    if @friendship.destroy
      flash[:success] = "You was delete add friend request!"
    else
      flash[:danger] = "You cant delete request!"
    end
  end

  private

  def friend_params
    params.require(:friend).permit :user_id, :friend_id, :status
  end

  def load_friend
    @friendship = Friend.find params[:id]
  end
end
