class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :upvote, :downvote]
  require 'date'

  def index
    @navbar_seasonal = true
    # @products = Product.where(Date.today => @product.season_start..@product.season_end )
    @products = Product.where('season_start <= ?', Date.today.strftime("%m")).where('season_end >= ?', Date.today.strftime("%m"))
    @new_season_all_products = Product.where('season_start = ?', (Date.today.strftime("%m").to_i + 1))
    @new_season_product = @new_season_all_products.sample
    @fruits = Product.where('category = ?', 'fruits')
    @vegetables = Product.where('category = ?', 'vegetables')
    @cereals = Product.where('category = ?', 'cereals')
    @dairy = Product.where('category = ?', 'dairy')
    @meat = Product.where('category = ?', 'meat')
  end

  def show

    @navbar_product = true
    @producers = Producer.geocoded
    if params[:search].present?
      @producers = @producers.near(params[:search], 200)
    end

    @markers = @producers.map do |producer|
      {
        lat: producer.latitude,
        lng: producer.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { producer: producer }),
        image_url: helpers.asset_url('marker.svg')
      }
    end
    @markers <<
      {
        lat: current_user.latitude,
        lng: current_user.longitude,
        image_url: helpers.asset_url('home-marker.svg')
      }
  end

  def upvote
    @product.liked_by(current_user)
  end

  def downvote
    @product.unliked_by(current_user)
  end

  private

  def set_product
      @product = Product.find(params[:id])
  end
end

