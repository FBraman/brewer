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
		@process_step = Process_step.new
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



	# def total_water
	# end
	# def into_ferementor
	# end
		
	# end
	# -taget gravity (preboil)
	# -target gravity (original gravity)
	# -target gravity (final gravity (post fermentation))
	# -abv (target gravity)

	private

	def recipe_params
		params.require(:recipe).permit(:recipe_name, :target_volume, :user_id, :efficiency, :mash_thickness, :mash_temp, :grain_temp)
	end



end