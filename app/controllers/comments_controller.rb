class CommentsController < ApplicationController
  def index
    @comments = Comment.comment_of(comment_params[:post_id]).page(params[:page]).per Settings.post.comment
  end

  def create
    @comment = current_user.comments.build comment_params
    if @comment.save
      @comments = Comment.comment_of(comment_params[:post_id]).page(params[:page]).per Settings.post.comment
    end
  end

  def edit
    @comment = Comment.find params[:id]
  end

  def update
    @comment = Comment.find params[:id]
    if @comment.update_attributes comment_params
      flash.now[:success] = "Update comment success!"
    else
      flash.now[:danger] = "Update comment false!"
    end
    @comments = Comment.comment_of(@comment.post_id).page(params[:page]).per Settings.post.comment
  end

  def destroy
    @comment = Comment.find params[:id]
    if @comment.destroy
      flash[:danger] = "Deleted comment ok!"
    end
    @comments = Comment.comment_of(@comment.post_id).page(params[:page]).per Settings.post.comment
  end

  private

  def comment_params
    params.require(:comment).permit :post_id, :user_id, :content
  end
end
