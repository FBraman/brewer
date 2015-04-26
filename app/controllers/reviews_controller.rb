class ReviewsController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]

	def show
		@review = Review.find(params[:id])
	end

	def new
		@user = current_user
		@recipe = Recipe.find(params[:id])
		@review = Review.new
	end

	def create
		@review = Review.create(review_params)
		if @review.save
			redirect_to recipe_path(@review.recipe)
		else
			flash[:notice] = "Failed to save your review"
		end
	end

	def destroy
		@recipe = Recipe.find(params[:recipe_id])
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to edit_recipe_path(@recipe)
	end


	protected

	def review_params
		params.require(:review).permit(:recipe_id, :user_id, :body)
	end
end