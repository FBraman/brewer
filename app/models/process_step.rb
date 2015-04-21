class ProcessStep < ActiveRecord::Base
	belongs_to :recipe
	belongs_to :step
	
	validates :step_id, presence: true
	validates :recipe_id, presence: true
end
