class WelcomeController < ApplicationController
  def index
    @jobs = Job.order(created_at: :desc)
  end
end