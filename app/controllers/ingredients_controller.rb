class IngredientsController <  ApplicationController
before_action :authenticate_user!, except: [:index, :show]
  def new
    @recipe = Recipe.find(params[:id])
    @ingredient = Ingredient.new
  end
  
	def show
		@ingredient = Ingredient.find(params[:id])
	end

	def create
    @ingredient = Ingredient.create(ingredient_params)
    if @ingredient.save
      redirect_to edit_recipe_path(@ingredient.recipe)
    else
      flash[:notice] = "Failed to save your fermentable."
      render 'ingredients/show'
    end
  end

  def edit
    @ingredient = Ingredient.find(params[:id])
    @recipe = @ingredient.recipe
    @ingredient = @recipe.ingredients.find(params[:id])
  end

   def update
    @ingredient = Ingredient.update(params[:id], ingredient_params)
    @recipe = @ingredient.recipe
    if @ingredient.save
      flash[:notice] = "Ingredient updated."
      redirect_to edit_recipe_path(@ingredient)
    else
      flash[:notice] = "Update failed"
      render :new
    end
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    if @recipe.owner?(current_user)
      @recipe = Recipe.find(params[:recipe_id])
      @ingredient = Ingredient.find(params[:id])
      @ingredient.destroy
      redirect_to edit_recipe_path(@recipe)
    else
      flash[:notice] = "You cannot change recipes you did not create"
    end
  end

  def ingredient_params
  	params.require(:ingredient).permit(:recipe_id, 
      :component_id, :version, :amount, :boil_time)
  end

end