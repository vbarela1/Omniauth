class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:facebook]

  has_many :trips
  # after_create :action_mailer
  

  def display_name
    "#{first_name} #{last_name}"
  end 

  def self.from_omniauth(auth)
    where(uid: auth.uid, provider: auth.provider).first_or_create do |user|
      name_arr = auth.info.name.split(' ')
      user.first_name = name_arr.first
      user.last_name = name_arr.last
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
    end
  end

  def action_mailer
    SignupMailer.new_signup(self).deliver
  end
end
