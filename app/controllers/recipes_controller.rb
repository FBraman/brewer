class RecipesController < ApplicationController
	
	def new
		@recipe = Recipe.new
	end

	def index
		@recipes = Recipe.all
	end

	def show
		@recipe = Recipe.find(params[:id])
		@ingredient = Ingredient.new
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

	def destroy
    @recipe = current_user.recipes.find(params[:id])
    @recipe.destroy
    redirect_to recipes_path, notice: 'Recipe deleted successfully!'
	end

	def strike_water
		grain = 0
		@recipe.ingredients.each do |x|
			x.amount += grain
		end
		(grain * @recipe.mash_thickness)/4
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
		params.require(:recipe).permit(:recipe_name, :target_volume, :user_id, :mash_thickness)
	end



end