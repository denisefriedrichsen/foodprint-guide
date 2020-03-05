class ProductsController < ApplicationController
  before_action :set_product, only: [:show]
  require 'date'

  def index
    # @products = Product.where(Date.today => @product.season_start..@product.season_end )
    @products = Product.where('season_start <= ?', Date.today.strftime("%m")).where('season_end >= ?', Date.today.strftime("%m"))
    @new_season_all_products = Product.where('season_start = ?', (Date.today.strftime("%m").to_i + 1))
    @new_season_product = @new_season_all_products.sample
  end

  def show
    @producers = Producer.geocoded #@product.offerings.producers
    @markers = @producers.map do |producer|
      {
        lat: producer.latitude,
        lng: producer.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { producer: producer }),
        image_url: helpers.asset_url('marker.svg')
      }
    end
  end

  private

  def set_product
      @product = Product.find(params[:id])
  end
end

