class ReviewsController < ApplicationController
  before_action :find_restaurant

  def new
    @review = Review.new
  end

    def create
      @review = Review.new(review_params)
      if @review.save
      redirect_to restaurant_path(@restaurant)
      else
      render :new
      end
    end

private

  def find_restaurant
    # in our routes for reviews it is :restaurant_id
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
