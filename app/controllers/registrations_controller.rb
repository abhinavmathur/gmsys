class RegistrationsController < Devise::RegistrationsController
  private
  def sign_up_params
    params.require(:user).permit(:name, :description, :email, :password, :password_confirmation, :facebook, :twitter, :linkedin, :image)
  end

  def account_update_params
    params.require(:user).permit(:name, :description, :email, :current_password, :facebook, :twitter, :linkedin, :image)
  end
end