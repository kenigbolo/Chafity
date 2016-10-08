class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  extend FriendlyId
  mount_uploader :image, AvatarUploader
  friendly_id :match_names , use: [:slugged, :finders]

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable
  # validates_presence_of :email , :image
  validates_uniqueness_of :email


  has_many :messages


  def self.from_omniauth(auth)
  	where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
  	  user.provider = auth.provider
  	  user.uid = auth.uid
  	  user.email = auth.info.email
  	  user.first_name = auth.info.first_name
  	  user.last_name = auth.info.last_name
  	  user.location = auth.info.location
  	  user.headline = auth.info.headline
  	  user.description = auth.info.description
      user.remote_image_url = auth.info.image
  	  user.phone = auth.info.phone
  	  user.industry = auth.info.industry
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


  def match_names
    names =  "#{self.first_name}.#{self.last_name}"
  end

  def slug_candidates
    [
        [:first_name, :last_name],
        [:first_name, :last_name,:id]
    ]
  end

# TODO: this method is to be update as well
	def self.search(search)
    if search
      User.where('first_name = ? OR last_name = ?', search, search)
    else
      User.all
    end
  end

end
