class Job < ActiveRecord::Base
  include PgSearch

  belongs_to :user

  enum job_type: [:all_types, :full_time, :contract, :remote, :freelance]
  after_initialize :set_default_job_type, :if => :new_record?

  validates :title, :job_type, presence: true
  validates :description, :city, :country, presence: true
  validates :apply_at_address, presence: true

  def set_default_job_type
    self.job_type ||= :all_types
  end

  pg_search_scope :search_jobs, :against => [:title, :description, :salary, :job_type, :city, :state, :country, :zip_code]

end
