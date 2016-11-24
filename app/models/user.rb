class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  include PgSearch
  extend FriendlyId

  friendly_id :slug_candidates, use: [:slugged, :finders]
  mount_uploader :image, AvatarUploader
  pg_search_scope :search,
  against: [
    :first_name, :last_name, :email, :location,
    :headline, :industry, :description
  ],
  using: { tsearch: { prefix: true } },
  associated_against: { charity: [:name, :address, :country] }

  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  validates_uniqueness_of :email
  validates_numericality_of :donation_amount, greater_than_or_equal_to: 3, message: "Come on give more >= 3 for charity please :)"
  has_many :messages
  belongs_to :charity
  accepts_nested_attributes_for :charity, reject_if: proc { |attributes| attributes['name'].blank? }

  before_save do
    first_name.capitalize
    last_name.capitalize
  end

  # FIXME: Why did you put this in here what's the issue?
  # def should_generate_new_friendly_id?
  #   false if Rails.env.production?
  # end

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

  def slug_candidates
    [
      [:first_name, :last_name],
      [:first_name, :last_name, :id]
    ]
  end

  def update_with_password(params, *options)
    if encrypted_password.blank?
      update_attributes(params, *options)
    else
      super
    end
  end
  
  def update_with_password(params, *options)
    if encrypted_password.blank?
      update_attributes(params, *options)
    else
      super
    end
  end
end
