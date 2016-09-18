class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  attr_accessor :email, :password, :password_confirmation, :remember_me

  # validates_presence_of :email
  # validates_uniqueness_of :email

  def self.from_omniauth(auth)
  	where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
  	  user.provider = auth.provider
  	  user.uid = auth.uid
  	  user.email = auth.info.email
  	  user.save
  	end
  end

  def self.new_with_session(params, session)
  	if session["devise.user_attributes"]
  	  new(session["devise.user_attributes"], without_protection: true) do |user|
  	  	user.attributes = params
  	  	user.valid?
  	  end
  	else
  	  super
  	end
  end

  def password_required?
  	super && provider.blank?
  end

end
