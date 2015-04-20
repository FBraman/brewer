class AddColumnRecipesMashtemp < ActiveRecord::Migration
  def up
  	add_column :recipes, :mash_temp, :integer
  end

  def down
  	remove_column :recipes, :mash_temp, :integer
  end
end
