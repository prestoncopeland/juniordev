class Visitor < ActiveRecord::Base
  validates :name, :email, presence: true
  validates :email, uniqueness: true
  validates_format_of :email, :with => /\A[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}\z/i
end
