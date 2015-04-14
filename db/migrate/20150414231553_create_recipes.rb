class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
    	t.string :recipe_name, null: false
    	t.float :target_volume
    	t.float :mash_thickness
    	t.integer :user_id, null: false
    end
  end
end
