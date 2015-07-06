class User < ActiveRecord::Base
  enum role: [:user, :admin, :employer]
  after_initialize :set_default_role, :if => :new_record?
  before_create :make_payment, unless: Proc.new { |user| user.admin? }
  attr_accessor :stripe_token


  has_many :jobs
  accepts_nested_attributes_for :jobs, allow_destroy: true, reject_if: :all_blank

  validates_associated :jobs
  validates :name, :website, :email, :telephone, presence: true


  def set_default_role
    self.role ||= :user
  end

  def make_payment
    MakePaymentService.new.perform(self)
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end


