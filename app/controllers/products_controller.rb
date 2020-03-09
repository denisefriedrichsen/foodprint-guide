class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :upvote, :downvote]
  require 'date'

  def index
    @navbar_seasonal = true
    # @products = Product.where(Date.today => @product.season_start..@product.season_end )
    @products = Product.where('season_start <= ?', Date.today.strftime("%m")).where('season_end >= ?', Date.today.strftime("%m"))
    @new_season_all_products = Product.where('season_start = ?', (Date.today.strftime("%m").to_i + 1))
    @new_season_product = @new_season_all_products.sample
    @fruits = Product.where('category = ? AND season_start <= ? AND season_end >= ?', 'fruits', Date.today.strftime("%m").to_i, Date.today.strftime("%m").to_i)
    @vegetables = Product.where('category = ? AND season_start <= ? AND season_end >= ?', 'vegetables', Date.today.strftime("%m").to_i, Date.today.strftime("%m").to_i)
    @cereals = Product.where('category = ? AND season_start <= ? AND season_end >= ?', 'cereals', Date.today.strftime("%m").to_i, Date.today.strftime("%m").to_i)
    @dairy = Product.where('category = ? AND season_start <= ? AND season_end >= ?', 'dairy', Date.today.strftime("%m").to_i, Date.today.strftime("%m").to_i)
    @meat = Product.where('category = ? AND season_start <= ? AND season_end >= ?', 'meat', Date.today.strftime("%m").to_i, Date.today.strftime("%m").to_i)
  end

  def show
    @navbar_product = true
    if params[:search].present?
      @producers = Producer.joins(:offerings).where(offerings: { product_id: @product.id }).near(params[:search], 200)
    else
      @producers = Producer.joins(:offerings).where(offerings: { product_id: @product.id }).near(current_user, 200)
    end


    @markers = @producers.map do |producer|
      {
        lat: producer.latitude,
        lng: producer.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { producer: producer }),
        image_url: helpers.asset_url('marker.svg')
      }

    end

    if params[:search].present?
      @results = Geocoder.search(params[:search])
      @markers <<
        {
          lat: @results.first.coordinates[0],
          lng: @results.first.coordinates[1],
          infoWindow: render_to_string(partial: "info_window", locals: { producer: @result }),
          image_url: helpers.asset_url('home-marker.svg')
        }

    else
      @markers <<
        {
          lat: current_user.latitude,
          lng: current_user.longitude,
          infoWindow: render_to_string(partial: "info_window", locals: { producer: current_user }),
          image_url: helpers.asset_url('home-marker.svg')
        }
    end
  end

  def upvote

    @product.liked_by(current_user)
    redirect_to products_path
  end

  def downvote
    @product.unliked_by(current_user)
    redirect_to products_path
  end

  private

  def set_product
      @product = Product.find(params[:id])
  end
end

