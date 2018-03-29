class SearchsController < ApplicationController
  def search
    if params[:q].nil?
      @posts = []
    else
      @posts = Post.search params[:q]
  end
end
