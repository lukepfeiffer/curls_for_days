class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email].downcase)
    if user && user.authenticate(params[:password])
      sign_in(user)
      redirect_to root_path(notice: "successful_sign_in")
    else
      redirect_to new_user_path
    end
  end

  def destroy
    sign_out_user
    redirect_to root_path(notice: 'successful_sign_out')
  end
end
