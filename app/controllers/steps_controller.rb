class StepsController < ApplicationController
before_action :authenticate_user!, except: [:index, :show]
	def new
		@step = Step.new
	end

	def index
		@steps = Step.all
	end

	def show
		@step = Step.find(params[:id])
	end

end