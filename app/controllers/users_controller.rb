class UsersController < ApplicationController
  before_action :authenticate_user, only: [:edit]

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

  def update
    if user.update(user_params)
      redirect_to user_path(user)
    else
      redirect_to :edit
    end
  end

  def user_params
    params.require(:user).permit(
      :email,
      :password,
      :username,
      :blogger,
      :description
    )
  end

  def authenticate_user
    unauthorized_redirect_route
    if current_user.blank?
      redirect_to @referrer_url.to_s
    elsif params[:id].present? && params[:id].to_i != current_user.id
      require 'pry'; binding.pry;
      redirect_to @referrer_url.to_s
    end
  end

  def unauthorized_redirect_route
      @referrer_url = URI.parse(request.referrer) rescue URI.parse('/')

      @referrer_url.query = Rack::Utils.parse_nested_query(@referrer_url.query).merge({notice: 'unauthorized'}).to_query
  end
end
