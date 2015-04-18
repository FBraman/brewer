class Recipe < ActiveRecord::Base
	belongs_to :user
	has_many :ingredients, dependent: :destroy
	has_many :components, through: :ingredients
	
	validates :recipe_name, uniqueness: true, presence: true
	validates :target_volume, presence: true

	BOIL_OFF = 1

	def recipe_efficiency
		ingredients[0].recipe.efficiency
	end

	def grain_amount
		grain = 0
		ingredients.each do |ingredient|
			if ingredient.component.version == "fermentable_grain"
				grain += ingredient.amount
			end
		end
		grain
	end

	def strike_water	
		(grain_amount * mash_thickness) / 4.0
	end

	def grain_absorption
		grain_amount * 0.15
	end

	def sparge_water
		target_volume - (strike_water - grain_absorption) + BOIL_OFF
	end

	def total_water
		strike_water + sparge_water
	end

	def preboil_volume
		target_volume + BOIL_OFF
	end

	def yeast_attenuation
		ingredient.component.attenuation
	end

	def total_gravity
		gravity_points = 0
		ingredients.each do |ingredient|
			if ingredient.component.version.include? "fermentable"
				if ingredient.component.version == "fermentable_grain"
					gravity_points += (                   (   (  (ingredient.component.ppg - 1) * 1000) * ingredient.amount) * (efficiency/100)  )
				elsif ingredient.component.version == "fermentable_sugar" || ingredient.component.version == "fermentable_dme"
					gravity_points += (((ingredient.component.ppg - 1) * 1000) * ingredient.amount)
				end
			end
		end
		gravity_points.to_i
	end

	def preboil_gravity
		points = (total_gravity / (target_volume + BOIL_OFF))
		points/1000 + 1
	end

	def target_og
		points = total_gravity / target_volume
		(points/1000 + 1)
	end

	def projected_final_gravity
		attn = 0
		ingredients.each do |ingredient|
			if ingredient.component.version == "yeast" && ingredient.component.attenuation > attn
				attn = ingredient.component.attenuation
				binding.pry
			end
		end
		fermented_gravity  =             (    (target_og - 1)   * 1000)         *       (attn.to_f/100)
		points = (    (target_og - 1)   * 1000) - fermented_gravity
		(points/1000) + 1
	end






	def owner?(current_user)
    user == current_user
  end
end