class RegistrationsController < Devise::RegistrationsController

  def new
    build_resource({})
    resource.jobs.build
    set_minimum_password_length
    yield resource if block_given?
    respond_with self.resource
  end

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation, :telephone, :website, :name, :stripe_token, jobs_attributes: [:id, :job_type, :title, :description, :salary, :city, :state, :country, :zip_code, :_destroy])
  end

end
