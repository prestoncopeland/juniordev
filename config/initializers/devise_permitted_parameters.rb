module DevisePermittedParameters
  extend ActiveSupport::Concern

  included do
    before_filter :configure_permitted_parameters
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name, :website, :telephone
    devise_parameter_sanitizer.for(:account_update) << :name, :website, :telephone
  end

end

DeviseController.send :include, DevisePermittedParameters