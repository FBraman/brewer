class IngredientsController <  ApplicationController

	def show
		@ingredient = Ingredient.find(params[:id])
	end

	def new
		@recipe = Recipe.find(params[:id])
		@ingredient = Ingredient.new
	end

	def create
    @ingredient = Ingredient.create(ingredient_params)
    if @ingredient.save
      redirect_to recipe_path(@ingredient.recipe)
    else
      flash[:notice] = "Failed to save your fermentable."
      render 'ingredients/show'
    end
  end

  def ingredient_params
  	params.require(:ingredient).permit(:recipe_id, :component_id, :amount)
  end

end