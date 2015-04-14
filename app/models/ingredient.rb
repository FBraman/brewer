class Ingredient < ActiveRecord::Base
	belongs_to :recipe
	belongs_to :component

	validates :recipe_id, presence: true
	validates :component_id, presence: true
end
