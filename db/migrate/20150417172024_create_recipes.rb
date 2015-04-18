class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
    	t.string :recipe_name, null: false
    	t.float :target_volume
    	t.integer :efficency
    	t.float :mash_thickness
    end
  end
end
