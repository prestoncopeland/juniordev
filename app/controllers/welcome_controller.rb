class WelcomeController < ApplicationController
  def index
    @jobs = Job.all
    @visitor = Visitor.new
  end
end