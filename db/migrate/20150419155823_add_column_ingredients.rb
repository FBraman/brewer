class AddColumnIngredients < ActiveRecord::Migration
  def up
  	add_column :ingredients, :boil_time, :integer
  end

  def down
  	remove_column :ingredients, :boil_time, :integer
  end
end
