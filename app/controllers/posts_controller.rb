class PostsController < ApplicationController

  def index
    @posts = Post.all
    @title = "Newsfeed"
  end

  def show
    @post = Post.find(params[:id])
  end


end
