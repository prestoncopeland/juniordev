class RemoveRoyceTables < ActiveRecord::Migration
  def change
    drop_table :royce_connector
    drop_table :royce_role
  end
end
