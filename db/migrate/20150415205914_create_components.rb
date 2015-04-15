class CreateComponents < ActiveRecord::Migration
  def change
    create_table :components do |t|
    	t.string :version
    	t.string :name, null: false
    	t.float :aa
    	t.float :ppg
    	t.float :srm
    	t.text :description
    end
  end
end
