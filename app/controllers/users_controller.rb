class UsersController < ApplicationController
  before_action :set_user


  def index_product
    @votes = @user.find_liked_items
    @products = @votes.filter { |item| item.class.to_s == "Product"}

    #@votes = @user.votes.where(votable_type: "Product")
  end

  def index_producer
     @votes = @user.find_liked_items
    @producers = @votes.filter { |item| item.class.to_s == "Producer"}
    #@votes = @user.votes.where(votable_type: "Producer")
  end

  # def show
  #   @vote = User.votes(:product_id])
  # end


  private
  def set_user
    @user = current_user
  end


end

