class RecipesController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]
	
	def new
		@recipe = Recipe.new
	end

	def index
		@recipes = Recipe.all
	end

	def show
		@recipe = Recipe.find(params[:id])
		@ingredient = Ingredient.new
		@process_step = ProcessStep.new
		@review = Review.new
		@user = current_user
	end

	def create
		@recipe = Recipe.new(recipe_params)
		if @recipe.save
			flash[:notice] = "You have created a recipe"
			redirect_to @recipe
		else
			flash[:notice] = "Recipe failed to save"
		end
	end

	def edit
    @recipe = current_user.recipes.find(params[:id])
    @ingredient = Ingredient.new
    @process_step = ProcessStep.new
  end

  def update
    @recipe = Recipe.update(params[:id], recipe_params)
    if @recipe.save
      flash[:notice] = "Recipe updated successfully!"
      redirect_to @recipe
    else
      flash[:notice] = "Update failed"
      render :new
    end
  end

	def destroy
    @recipe = current_user.recipes.find(params[:id])
    @recipe.destroy
    redirect_to recipes_path, notice: 'Recipe deleted successfully!'
	end

	private
	def recipe_params
		params.require(:recipe).permit(:recipe_name, :target_volume, :user_id, 
			:efficiency, :mash_thickness, :mash_temp, :grain_temp, :boil_length)
	end

	def authorize_user
    if !user_signed_in? || !current_user.admin?
      raise ActionController::RoutingError.new("Not Found")
    end
  end
end