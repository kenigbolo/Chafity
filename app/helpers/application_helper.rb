module ApplicationHelper

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  private
  def charity_name
    @charity = Charity.where('id = ?', current_user.charity_id)
    @charity.first.name
  end

end
