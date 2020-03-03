class FavouriteProductsController < ApplicationController
  before_action: :set_favourite_product, only: [:destroy]

  def create
    @favourite_product = Favourite_product.new(favourite_product_params)
    @favourite_product.user_id = current_user
    @favourite_product.save!
    redirect_to favourite_products_path
  end

  def index
    @favourite_products = Favourite_products.where(user: current_user)
  end

  def destroy
    @favourite_product.delete
    redirect_to favourite_products_path
  end

  private

  def favourite_product_params
      params.require(:favourite_product).permit(:product_id)
  end

  def set_favourite_product
      @favourite_product = Favourite_product.find(params[:id])
  end

end
