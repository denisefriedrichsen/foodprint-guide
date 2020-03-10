class UsersController < ApplicationController
  before_action :set_user


  def index_product
    @navbar_favourite_product = true
    @votes = @user.find_liked_items
    @products = @votes.filter { |item| item.class.to_s == "Product"}
  end

  def index_producer
    @navbar_favourite_producer = true
    @votes = @user.find_liked_items
    @producers = @votes.filter { |item| item.class.to_s == "Producer"}

    @markers = @producers.map do |producer|
      {
        lat: producer.latitude,
        lng: producer.longitude,
        infoWindow: render_to_string(partial: 'products/info_window', locals: { producer: producer }),
        image_url: helpers.asset_url('marker.svg')
      }

    end
  end

  private

  def set_user
    @user = current_user
  end

end

