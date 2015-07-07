class RegistrationsController < Devise::RegistrationsController
  after_action :mailing_sign_up, :only => :create

  def new
    build_resource({})
    resource.jobs.build
    set_minimum_password_length
    yield resource if block_given?
    respond_with self.resource
  end

  private

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation, :telephone, :website, :name, :stripe_token, jobs_attributes: [:id, :job_type, :title, :apply_at_address, :description, :salary, :city, :state, :country, :zip_code, :_destroy])
  end

  def account_update_params
    params.require(:user).permit(:email, :password, :password_confirmation, :telephone, :website, :name, :stripe_token, :current_password, jobs_attributes: [:id, :job_type, :title, :apply_at_address, :description, :salary, :city, :state, :country, :zip_code, :_destroy])
  end

  def mailing_sign_up
    return if resource.admin?
    if resource.persisted?
      MailingListSignupJob.perform_later(resource)
    end
  end

end
