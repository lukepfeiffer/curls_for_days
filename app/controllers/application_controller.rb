class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  authem_for :user

  def set_notice
    @specific_message = params[:notice]
    @notice_messsage = "Sign Up Successful" if params[:notice] = "successful_sign_up"
  end

end
