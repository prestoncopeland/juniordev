class Job < ActiveRecord::Base
  belongs_to :user

  enum job_type: [:all, :full_time, :contract, :remote, :freelance]
  after_initialize :set_default_job_type, :if => :new_record?

  def set_default_job_type
    self.job_type ||= :all

end
