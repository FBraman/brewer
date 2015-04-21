class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
    	t.string :step_name, null: false
    	t.text :description, null: false
    end
  end
end
