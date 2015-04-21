class Step < ActiveRecord::Base
	has_many :process_steps
	has_many :recipes, through: :process_steps

	validates :step_name, presence: true
	validates :description, presence: true
end