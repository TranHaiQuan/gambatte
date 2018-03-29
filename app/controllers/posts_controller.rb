class PostsController < ApplicationController
  # before_action :authenticate_user!, expect: [:show, ]
  before_action :post_obj, only: [:edit, :destroy]
  def index
    if params[:query].present?
      @posts = Post.search params[:query], suggest: true
    else
      @posts = Post.all_post.page(params[:page]).per Settings.post.all_post
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build post_params
    if @post.save
      flash[:success] = "You was created new post!"
      redirect_to root_path
    else
      flash[:success] = "You was created new post!"
      redirect_to root_path
    end
  end

  def show
    @post = Post.find params[:id]
    @comment = Comment.new
    @comments = Comment.comment_of(params[:id]).page(params[:page]).per Settings.post.comment
  end

  def update
    @post = Post.find params[:id]
    if @post.update_attributes post_params
      flash[:success] = "Update success"
      redirect_to post_path @post
    else
      flash[:danger] = "Update false"
    end
  end

  def destroy
    if @post.destroy
      flash[:success] = "Delete success"
      redirect_to root_path
    else
      flash[:danger] = "Delete false"
    end
  end

  def autocomplete
    render json: Post.search(params[:query], {
      fields: ["title^5", "content"],
      match: :word_start,
      limit: 10,
      load: false,
      misspellings: {below: 5}
    }).map(&:title)
  end
  private

  def post_obj
     @post = Post.find params[:id]
  end

  def post_params
    params.require(:post).permit :title, :content, :like
  end
end
