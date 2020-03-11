class UsersController < ApplicationController
  before_action :set_user


  def index_product
    @title = "Favourite products"
    @votes = @user.find_liked_items
    @products = @votes.filter { |item| item.class.to_s == "Product"}
    @products_in_season = []
    @products_not_in_season = []
  end

  def index_producer
    @title = "Favourite producers"
    @votes = @user.find_liked_items
    @producers = @votes.filter { |item| item.class.to_s == "Producer"}
  end

  private

  def set_user
    @user = current_user
  end

end

