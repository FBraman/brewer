class Review < ActiveRecord::Base
	belongs_to :user
	belongs_to :recipe

	validates :recipe_id, presence: true
	validates :user_id, presence: true
	validates :body, presence: true

	def owns?(current_user)
    user == current_user
  end

end
