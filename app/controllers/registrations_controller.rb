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
    :current_password, :donation_amount, :charity_id, :phone)
  end

  protected

  def after_sign_up_path_for(resource)
    edit_user_registration_path, notice = "Welcome Home James"
  end
end
