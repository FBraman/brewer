class AddColumnRecipesEfficiency < ActiveRecord::Migration
  def change
  	add_column :recipes, :efficiency, :float
  end
end
