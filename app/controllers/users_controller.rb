class UsersController < ApplicationController
  expose :user
  expose :users do
    User.all
  end

  def create
    if user.save
      sign_in(user)
      redirect_to root_path(notice: "successful_sign_up")
    else
      render :new
    end
  end

  def user_params
    params.require(:user).permit(
      :email,
      :password,
      :username,
      :blogger
    )
  end
end
