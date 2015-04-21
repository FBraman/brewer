class DropProcesses < ActiveRecord::Migration
  def up
  	rename_table :processes, :process_steps
  end

  def down
  	rename_table :process_steps, :processes
  end
end
