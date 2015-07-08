class RemoveJobTypeFromJobs < ActiveRecord::Migration
  def change
    remove_column :jobs, :job_type
  end
end
