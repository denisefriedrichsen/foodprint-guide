class UsersController < ApplicationController
  before_action :set_user


  def index(votable_type)
    @votes = User.votes.where(votable_type: "product")
  end

  # def show
  #   @vote = User.votes(:product_id])
  # end


  private
    def set_user
  end

  @user = current_user

end

