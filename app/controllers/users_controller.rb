class UsersController < ApplicationController
  def create
    user = User.create(user_params)
    SignupMailer.new_signup(user).deliver
    redirect_to :root 
  end 

private
  def user_params
    params.require(:user).permit(:name, :email)
  end 

end 
   
