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

  def process_step_params
  	params.require(:process_step).permit(:step_id, :recipe_id, :step_notes)
  end
 

end