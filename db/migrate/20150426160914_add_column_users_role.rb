class AddColumnUsersRole < ActiveRecord::Migration
  def up
  	add_column :users, :role, :string, null: false, default: "member"
  end
  def down
  	remove_column :users, :role, :string, null: false, default: "member"
  end
end
