class ComponentsController < ApplicationController
	def new
		@component = Component.new
	end

	def show
		@component = Component.find(params[:id])
	end

	def index
		@component.all
	end



end