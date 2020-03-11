class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :upvote, :downvote]
  require 'date'

  def index
    @products = Product.where('season_start <= ?', Date.today.strftime("%m")).where('season_end >= ?', Date.today.strftime("%m"))
    @new_season_all_products = Product.where('season_start = ?', (Date.today.strftime("%m").to_i + 1))
    @new_season_product = @new_season_all_products.sample
    @vegetables = Product.where('category = ? AND season_start <= ? AND season_end >= ?', 'vegetables', Date.today.strftime("%m").to_i, Date.today.strftime("%m").to_i)
    @cereals = Product.where('category = ? AND season_start <= ? AND season_end >= ?', 'cereals', Date.today.strftime("%m").to_i, Date.today.strftime("%m").to_i)
    @dairy = Product.where('category = ? AND season_start <= ? AND season_end >= ?', 'dairy', Date.today.strftime("%m").to_i, Date.today.strftime("%m").to_i)
    @meat = Product.where('category = ? AND season_start <= ? AND season_end >= ?', 'meat', Date.today.strftime("%m").to_i, Date.today.strftime("%m").to_i)

    @vegetable_count = @vegetables.count
    @cereal_count = @cereals.count
    @dairy_count = @dairy.count
    @meat_count = @meat.count

    # FRUITS
    @fruits = Product.where('category = ?', 'fruits')
    @fruits_season = []
    @fruits.each do |product|
      if product.season_start > product.season_end && product.season_end >= Date.today.strftime("%m").to_i
        @fruits_season << product
      elsif product.season_start <= Date.today.strftime("%m").to_i && product.season_end >= Date.today.strftime("%m").to_i
        @fruits_season << product
      end
    end
     @fruit_count = @fruits_season.count

    #VEGETABLES
    @vegetables = Product.where('category = ?', 'vegetables')
    @vegetables_season = []
    @vegetables.each do |product|
      if product.season_start > product.season_end && product.season_end >= Date.today.strftime("%m").to_i
        @vegetables_season << product
      elsif product.season_start <= Date.today.strftime("%m").to_i && product.season_end >= Date.today.strftime("%m").to_i
        @vegetables_season << product
      end
    end
     @fruit_count = @vegetables_season.count


  end

  def show
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
          infoWindow: render_to_string(partial: "info_window", locals: { producer: current_user}),
          image_url: helpers.asset_url('home-marker.svg')
        }
    end
  end

  def upvote
    @product.liked_by(current_user)
    respond_to do |format|
      format.html { redirect_to products_path }
      format.js
    end
  end

  def downvote
    @product.unliked_by(current_user)
    respond_to do |format|
      format.html { redirect_to products_path }
      format.js
    end
  end

  private

  def set_product
      @product = Product.find(params[:id])
  end
end

