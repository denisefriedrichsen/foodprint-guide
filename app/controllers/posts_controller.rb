class PostsController < ApplicationController

  def index
    @navbar_newsfeed = true
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end


end
