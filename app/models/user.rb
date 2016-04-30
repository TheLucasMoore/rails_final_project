class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, 
         :omniauth_providers => [:twitter, :facebook]

  has_many :comments
  has_many :recipes

  enum role: [:user, :moderator, :admin]

  after_initialize :set_default_user_role

  def set_default_user_role
    self.role = :user unless self.role
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      #twitter doesn't provide email through their API
      user.name = auth.info.name
      user.email = "#{auth.info.name}@twitter.com"
      user.password = Devise.friendly_token[0,20]
    end
  end

end
