class RemoveColumnRecipesEfficency < ActiveRecord::Migration
  def change
  	remove_column :recipes, :efficency
  end
end
