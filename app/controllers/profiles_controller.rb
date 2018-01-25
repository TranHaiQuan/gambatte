class ProfilesController < ApplicationController
  def show
    @user = User.find params[:id]
    if !@user
      redirect_to root_path
    else
      @posts = Post.post_of(@user.id).page(params[:page]).per Settings.post.all_post
    end
  end
end
