class ApplicationController < ActionController::Base
  before_action :set_notice
  protect_from_forgery with: :exception
  authem_for :user

  def set_notice
    @specific_message = params[:notice]
    @notice_message = "Sign Up Successful" if @specific_message == "successful_sign_up"
    @notice_message = "Sign In Successful" if @specific_message == "successful_sign_in"
    @notice_message = "Signed Out" if @specific_message == "successful_sign_out"
  end

end
