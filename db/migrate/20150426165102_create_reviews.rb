class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
    	t.integer :recipe_id, null: false
    	t.integer :user_id, null: false
    	t.text :body, null: false
    end
  end
end
