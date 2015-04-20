class AddColumnRecipesGrainTemp < ActiveRecord::Migration
  def up
  	add_column :recipes, :grain_temp, :float
  end

  def down
  	remove_column :recipes, :grain_temp, :float
  end
end
