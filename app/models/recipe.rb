class Recipe < ActiveRecord::Base
	belongs_to :user
	has_many :ingredients, dependent: :destroy
	has_many :components, through: :ingredients
	
	validates :recipe_name, uniqueness: true, presence: true
	validates :target_volume, presence: true

	BOIL_OFF = 1

	def grain_amount
		grain = 0
		ingredients.each do |ingredient|
			if ingredient.component.version == "fermentable"
				grain += ingredient.amount
			end
		end
		grain
	end

	def strike_water	
		(grain_amount * mash_thickness) / 4.0
	end

	def grain_absorption
		grain = 0
		ingredients.each do |ingredient|
			if ingredient.component.version == "fermentable"
				grain += ingredient.amount
			end
		end
		grain * 0.15
	end

	def sparge_water
		grain = 0
		ingredients.each do |ingredient|
			if ingredient.component.version == "fermentable"
				grain += ingredient.amount
			end
		end
		grain_absorption = grain * 0.15
		strike_water = (grain * mash_thickness) / 4.0
		target_volume - (strike_water - grain_absorption) + BOIL_OFF
	end

	def total_water
		strike_water + sparge_water
	end

	def preboil_volume
		target_volume + BOIL_OFF
	end

	def preboil_gravity
		gravity_points = 0
		ingredients.each do |ingredient|
			if ingredient.component.version == "fermentable"
				gravity_points += (((ingredient.component.ppg - 1) * 1000) * ingredient.amount)
			end
		end
		points = (gravity_points.to_f / (target_volume + BOIL_OFF))
		(points/1000 + 1)
	end

	def pregravity
		total_gravity.to_f / (target_volume + BOIL_OFF)
	end

	def target_og
		gravity_points = 0
		ingredients.each do |ingredient|
			if ingredient.component.version == "fermentable"
				gravity_points += (((ingredient.component.ppg - 1) * 1000) * ingredient.amount)
			end
		end
		points = (gravity_points.to_f / (target_volume))
		(points/1000 + 1)
	end

	# def target_final_gravity
	# end






	def owner?(current_user)
    user == current_user
  end
end