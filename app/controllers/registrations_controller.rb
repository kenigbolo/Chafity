class RegistrationsController < Devise::RegistrationsController

  #TODO: overrvide devise registration controllers
  private
  def sign_up_params
    params.
    require(:user).
    permit(:email, :password, :password_confirmation,
    :location,:headline, :image, :description, :first_name, :last_name, )
  end

  def account_update_params
    params
    .require(:user)
    .permit(:first_name, :last_name, :email, :location,
      :headline, :image, :headline, :description, :location, :industry,
    :current_password)
  end
end
