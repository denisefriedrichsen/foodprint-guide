class ProductsController < ApplicationController
  before_action :set_product, only: [:show]

  def index
    @products = Product.all
  end

  def show
    @producers = @product.offerings.producers
  end

  private

  def set_product
      @product = Product.find(params[:id])
  end
end
