class ReviewsController < ApplicationController
  def create
    @shop = Shop.find(params[:shop_id])
    @review = Review.new(review_params)
    @review.shop = @shop
    @review.user = current_user

    respond_to do |format|
      if @review.save!
        format.html { redirect_to shop_path(@shop) }
        format.json # Follow the classic Rails flow and look for a create.json view
      else
        format.html { render "shops/show", status: :unprocessable_entity }
        format.json # Follow the classic Rails flow and look for a create.json view
      end
    end
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
