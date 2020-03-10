class ProducersController < ApplicationController
  # before_action :set_favourite_product, only: [:show]
  before_action :set_producer, only: [:show, :upvote, :downvote]

  def show
    @producer = Producer.find(params[:id])
    @products = Product.joins(:offerings).where(offerings: { producer_id: @producer.id })
    @post = Post.where(producer_id: @producer.id).last
    @all_posts = Post.where(producer_id: @producer.id)
  end

    def upvote

    @producer.liked_by(current_user)
    redirect_to producer_path
  end

  def downvote
    @producer.unliked_by(current_user)
    redirect_to producer_path
  end


  private

  # def set_favourite_product
  #     @favourite_product = Favourite_product.find(params[:id])
  # end

   def set_producer
      @producer = Producer.find(params[:id])
      @title = @producer.company_name
  end
end
