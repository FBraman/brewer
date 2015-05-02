class CreateBrewInstance < ActiveRecord::Migration
  def change
    create_table :brew_instances do |t|
    	t.integer :recipe_id, null: false
    	t.datetime :created_at
    	t.integer	:grain_temp
    	t.integer :strikewater_temp
    	t.integer :mash_temp
    	t.float :preboil_gravity
    	t.float :preboil_volume
    	t.integer :boil_time
    	t.float :post_boil_volume
    	t.float :original_gravity
    	t.float :final_gravity
    	t.integer :mash_to_boil_time
    	t.integer :boil_to_pitch_time
    	t.text :notes
    	t.integer :attenuation
    end
  end
end
