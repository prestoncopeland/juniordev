class WelcomeController < ApplicationController
  def index
    @jobs = Job.where('created_at <= 30.days.ago').order(created_at: :desc)
  end
end