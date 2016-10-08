class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  
  def all
  	user = User.from_omniauth(request.env["omniauth.auth"])
  	if user.persisted?
  	  # Redirect to user profile
			byebug
  	  sign_in_and_redirect user, notice: "Signed in!"
  	else
  	  redirect_to new_user_registration_url
  	  session["devise.user_attributes"] = user.user_attributes
  	end
  end
  alias_method :linkedin, :all
end
