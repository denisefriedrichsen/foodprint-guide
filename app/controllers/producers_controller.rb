class ProducersController < ApplicationController
  # before_action :set_favourite_product, only: [:show]
  before_action :set_producer, only: [:show]

  def show
    @producer = Producer.find(params[:id])
    @products = Product.joins(:offerings).where(offerings: { producer_id: @producer.id })
    @post = Post.where(producer_id: @producer.id).last
    @navbar_producer = true
  end

  private

  # def set_favourite_product
  #     @favourite_product = Favourite_product.find(params[:id])
  # end

   def set_producer
      @producer = Producer.find(params[:id])
  end
end
