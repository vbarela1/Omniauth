class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

  has_many :trips
  # after_create :action_mailer
  

  def display_name
    "#{first_name} #{last_name}"
  end 

  def self.from_omniauth(auth)
    if user = where(email: auth[:info][:email]).last
      user.uid = auth.uid 
      user.provider = auth.provider
      user.save
    else
      name_arr = auth.info.name.split(' ') 
      user = User.create( 
      first_name: name_arr.first,
      last_name: name_arr.last,
      email: auth.info.email,
      password: Devise.friendly_token[0, 20])
    end 
    return user
  end

  def action_mailer
    SignupMailer.new_signup(self).deliver
  end
end
