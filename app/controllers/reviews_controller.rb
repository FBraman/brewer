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
		binding.pry
		if @review.save
			redirect_to recipes_path
		else
			flash[:notice] = "Failed to save your review"
		end
	end


	protected

	def review_params
		params.require(:review).permit(:recipe_id, :user_id, :body)
	end
end