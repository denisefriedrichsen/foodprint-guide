class ProductsController < ApplicationController
  before_action :set_product, only: [:show]
  require 'date'

  def index
    # @products = Product.where(Date.today => @product.season_start..@product.season_end )
    @products = Product.where('season_start <= ?', Date.today.strftime("%m")).where('season_end >= ?', Date.today.strftime("%m"))
  end

  def show
    @producers = @product.offerings.producers
  end

  private

  def set_product
      @product = Product.find(params[:id])
  end
end

