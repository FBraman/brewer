class AddColumnRecipesBoillength < ActiveRecord::Migration
  def change
  	add_column :recipes, :boil_length, :integer
  end
end
