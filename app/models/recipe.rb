class Recipe < ActiveRecord::Base
	belongs_to :user
	has_many :ingredients, dependent: :destroy
	has_many :components, through: :ingredients
	
	validates :recipe_name, uniqueness: true, presence: true
	validates :target_volume, presence: true

	def strike_water
		grain = 0
		ingredients.each do |ing|
			grain += ing.amount
		end
		(grain * mash_thickness) / 4.0
	end
end