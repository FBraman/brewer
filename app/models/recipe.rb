class Recipe < ActiveRecord::Base
	belongs_to :user
	has_many :ingredients, dependent: :destroy
	has_many :components, through: :ingredients
	has_many :process_steps, dependent: :destroy
	has_many :steps, through: :process_steps
	
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
				if ingredient.amount == nil
					grain += 0
				else
					grain += ingredient.amount
				end
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
		sw = target_volume - (strike_water - grain_absorption) + BOIL_OFF
		sprintf("%.2f", sw)
	end

	def total_water
		strike_water + sparge_water.to_f
	end

	def preboil_volume
		target_volume + BOIL_OFF
	end

	def strike_water_temp
		swt = (0.2/mash_thickness) * (mash_temp - grain_temp) + mash_temp
		sprintf("%.2f", swt)
	end

	def yeast_attenuation
		ingredient.component.attenuation
	end

	def total_gravity
		gravity_points = 0
		if ingredients == nil
			gravity_points = 0
		else
			ingredients.each do |ingredient|
				if ingredient.component.version.include? "fermentable"
					if ingredient.amount == nil
						gravity_points += 0
					elsif ingredient.component.version == "fermentable_grain"
						gravity_points += (                   (   (  (ingredient.component.ppg - 1) * 1000) * ingredient.amount) * (efficiency/100)  )
					elsif ingredient.component.version == "fermentable_sugar" || ingredient.component.version == "fermentable_dme"
						gravity_points += (((ingredient.component.ppg - 1) * 1000) * ingredient.amount)
					end
				end
			end	
		end
		gravity_points.to_i
	end

	def preboil_gravity
		points = (total_gravity / (target_volume + BOIL_OFF))
		pg = points/1000 + 1
		sprintf("%.3f", pg)
	end

	def target_og
		points = total_gravity / target_volume
		to = (points/1000 + 1)
		sprintf("%.3f", to)
	end

	def projected_final_gravity
		attn = 0
		if ingredients == nil
			att = 0
		else
			ingredients.each do |ingredient|
				if ingredient.component.version == "yeast" && ingredient.component.attenuation > attn
					attn = ingredient.component.attenuation
				end
			end
		end
		fermented_gravity  =             (    (target_og.to_f - 1)   * 1000)         *       (attn.to_f/100)
		points = (    (target_og.to_f - 1)   * 1000) - fermented_gravity
		pfg = ((points/1000) + 1)
		sprintf("%.3f", pfg)
	end

	# def alpha_acids
	# 	ingredient.component.aa
	# end

	# def boil_time
	# 	ingredient.boil_time
	# end

	# def weight_oz
	# 	ingredient.amount
	# end

	def ibu #######tinseth###############
	  original_gravity = ((total_gravity / target_volume) / 1000) + 1 
		ibus = 0
		if ingredients == nil
			ibus = 0
		else
			ingredients.each do |ingredient|
				if ingredient.amount == 0
					ibus += 0
				elsif ingredient.component.version == "hops"
					weight_oz = ingredient.amount
					boil_time = ingredient.boil_time
					alpha_acids = ingredient.component.aa
					if weight_oz == nil || boil_time == nil || alpha_acids == nil
						ibus = 0
					else
						ibus += (1.65 * (0.000125 ** (original_gravity - 1))) * (( 1 - (2.71** (-0.04 * boil_time))) / 4.15 ) * (((alpha_acids/100) * weight_oz * 7490) / target_volume )
					end
				end
			end
		end
		ibus.to_i
	end

	def owner?(current_user)
    user == current_user
  end
end