class DropMigrationsAgain < ActiveRecord::Migration
  def change
  	drop_table :components_agains
  end
end
