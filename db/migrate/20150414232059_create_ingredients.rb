class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
    	t.integer :recipe_id, null: false
    	t.integer :component_id, null: false
    	t.float :amount
    end
  end
end
