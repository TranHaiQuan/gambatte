class ProfilesController < ApplicationController
  def show
    @user = User.find params[:id]
    @requests = Friend.list_request(@user.id).page(params[:page]).per Settings.user.friend
    @list_waiting = Friend.list_waiting(@user.id).page(params[:page]).per Settings.user.friend
    if !@user
      redirect_to root_path
    else
      @posts = Post.post_of(@user.id).page(params[:page]).per Settings.post.all_post
    end
  end
end
