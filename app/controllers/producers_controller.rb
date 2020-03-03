class ProducersController < ApplicationController
  before_action: :set_favourite_product, only: [:show]
  before_action: :set_producer, only: [:show]

  def show
  end

  private

  def set_favourite_product
      @favourite_product = Favourite_product.find(params[:id])
  end

   def set_producer
      @producer = Producer.find(params[:id])
  end
end
