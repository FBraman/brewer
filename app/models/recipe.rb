class Recipe < ActiveRecord::Base
	belongs_to :user
	has_many :ingredients, dependent: :destroy
	has_many :components, through: :ingredients
	
	validates :recipe_name, uniqueness: true, presence: true
	validates :target_volume, presence: true

	def strike_water
		grain = 0
		ingredients.each do |ing|
			if ing.component.version == "fermentable"
				grain += ing.amount
			end
		end
		(grain * mash_thickness) / 4.0
	end


	def owner?(current_user)
    user == current_user
  end
end