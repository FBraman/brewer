class BrewInstancesController <  ApplicationController
before_action :authenticate_user!, except: [:index, :show]

  def new
    @recipe = Recipe.find(params[:recipe_id])
    @brew_instance = BrewInstance.new
  end
  
	def show
		@brew_instance = BrewInstance.find(params[:recipe_id])
	end

  def index
    @recipe = Recipe.find(params[:recipe_id])
    if params[:search]
      @brew_instances = BrewInstances.search(params[:search]) #consider an order, and add page params when pagination added
    else
      @brew_instances = @recipe.brew_instances.all
    end
  end

	def create
    @brew_instance = BrewInstance.create(brew_instance_params)
    if @brew_instance.save
      redirect_to recipe_path(@brew_instance.recipe)
    else
      flash[:notice] = "Failed to save your fermentable."
      render 'ingredients/show'
    end
  end

  def edit
    @brew_instance = BrewInstance.find(params[:id])
    @recipe = @brew_instance.recipe
    @brew_instance = @recipe.brew_instance.find(params[:id])
    @user = current_user
  end

  #  def update
  #   @brew_instance = BrewInstance.update(params[:id], brew_instance_params)
  #   @recipe = @brew_instance.recipe
  #   if @brew_instance.save
  #     flash[:notice] = "Brew day updated."
  #     redirect_to edit_brew_instance_path(@brew_instance)
  #   else
  #     flash[:notice] = "Update failed"
  #     render :new
  #   end
  # end

  # def destroy
  #   @brew_instance = BrewInstance.find(params[:recipe_id])
  #   if @brew_instance.owner?(current_user)
  #     @recipe = Recipe.find(params[:recipe_id])
  #     @brew_instance = BrewInstance.find(params[:id])
  #     @brew_instance.destroy
  #     redirect_to edit_recipe_path(@recipe)
  #   else
  #     flash[:notice] = "You cannot change brew days you did not create"
  #   end
  # end

  def brew_instance_params
  	params.require(:brew_instance).permit(:recipe_id, 
      :grain_temp, :strikewater_temp, :mash_temp, :preboil_gravity,
      :preboil_volume, :boil_time, :post_boil_volume, :original_gravity, 
      :final_gravity, :mash_to_boil_time, :boil_to_pitch_time, :notes, :attenuation)
  end

end