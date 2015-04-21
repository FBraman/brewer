class CreateProcesses < ActiveRecord::Migration
  def change
    create_table :processes do |t|
    	t.integer :step_id
    	t.integer :recipe_id
    	t.text :step_notes
    end
  end
end
