class JobsController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @jobs = Job.where("DateTime.new - created_at <= 30")
  end

  def show
    @job = Job.find(params[:id])
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(secure_params)
    @job.user_id = current_user.id
    if @job.save
      redirect_to @job, notice: 'Job successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @job = Job.find(params[:id])
    unless current_user.admin?
      redirect_to :back, :alert => "Access denied."
    end
    if @job.update_attributes(secure_params)
      redirect_to jobs_path, :notice => "Job updated."
    else
      redirect_to jobs_path, :alert => "Unable to update job."
    end
  end

  def destroy
    job = Job.find(params[:id])
    unless current_user.admin?
      redirect_to :back, :alert => "Access denied."
    end
    job.destroy
    redirect_to jobs_path, :notice => "Job deleted."
  end

  private

  def secure_params
    params.require(:job).permit(:user_id, :title, :job_type, :description, :salary, :city, :state, :country, :zip_code)
  end
end
