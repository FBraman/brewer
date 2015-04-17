class CreateComponents < ActiveRecord::Migration
  def change
    create_table :components do |t|
    	t.string :version
    	t.string :name, null: false
    	t.float :aa
    	t.float :ppg
    	t.float :srm
        t.integer :attenuation
        t.string :temperature_range
    	t.text :description
        t.string :alcohol_tolerance
        t.string :flocculation
    end
  end
end
