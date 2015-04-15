class CreateComponentsAgain < ActiveRecord::Migration
  def change
    create_table :components_agains do |t|
    	t.string :type
    	t.string :name, null: false
    	t.float :aa
    	t.float :ppg
    	t.float :srm
    	t.text :description
    end
  end
end
