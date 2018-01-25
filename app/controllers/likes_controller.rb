class LikesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def create
    @user = current_user.id
    @post = Post.find params[:format]
    @like = Like.new user_id: @user, post_id: @post.id
    @new_like = Like.find_by user_id: @user, post_id: @post.id

    if !@new_like
      @like.save
      @is_like = true
    else
      @new_like.destroy
      @is_like = false
    end
  end
end
