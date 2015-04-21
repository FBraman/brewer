class Process_step < ActiveRecord::Base
	belongs_to :recipe
	belongs_to :step
	
	validates :step_id, presence: true
	validates :recipe_id, presence: true
end
