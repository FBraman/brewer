class Recipe < ActiveRecord::Base
	belongs_to :user
	has_many :ingredients, dependent: :destroy
	has_many :components, through: :ingredients
	
	validates :recipe_name, uniqueness: true, presence: true
	validates :target_volume, presence: true


end