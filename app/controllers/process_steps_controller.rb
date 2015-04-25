class ProcessStepsController < ApplicationController

	def new
		@recipe = Recipe.find(params[:id])
		@process_step = ProcessStep.new
  end

	def show
		@process_step = Process_step.find(params[:id])
	end

	def index
		@recipe = Recipe.find(params[:id])
		@process_steps = Step.all
	end

	def create
		@recipe = Recipe.find(params[:recipe_id])
    @process_step = ProcessStep.create(process_step_params)
    if @process_step.save
      redirect_to recipe_path(@process_step.recipe)
    else
      flash[:notice] = "Failed to save your fermentable."
      render 'process_step/show'
    end
  end

  def destroy
  	@recipe = Recipe.find(params[:recipe_id])
  	if @recipe.owner?(current_user)
  		@recipe = Recipe.find(params[:recipe_id])
  		@process_step = ProcessStep.find(params[:id])
  		@process_step.destroy
  		redirect_to recipe_path(@recipe)
  	else
  		flash[:notice] = "You cannot change recipes you did not create"
  	end
  end

  def edit
  	@process_step = ProcessStep.find(params[:id])
  	@recipe = @process_step.recipe
  	@process_step = @recipe.process_steps.find(params[:id])
  end

  def update
  	@process_step = ProcessStep.update(params[:id], process_step_params)
  	if @process_step.save
  		redirect_to @process_step.recipe
  	else
  		flash[:notice] = "Notes update failed"
  	end
  end


  def process_step_params
  	params.require(:process_step).permit(:step_id, :recipe_id, :step_notes)
  end
 

end