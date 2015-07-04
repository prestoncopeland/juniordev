class CreateAdminService
  def call
    user = User.find_or_create_by!(email: Rails.application.secrets.admin_email) do |user|
        user.password = Rails.application.secrets.admin_password
        user.password_confirmation = Rails.application.secrets.admin_password
        user.name = "Junior Developer"
        user.website = "juniorsoftwaredeveloper.com"
        user.telephone = "444 444 4444"
        user.admin!
      end
  end
end