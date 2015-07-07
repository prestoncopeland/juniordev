class AddApplyAtAddressToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :apply_at_address, :string
  end
end
