class ApplicationController < ActionController::Base
  before_filter :set_notice
  protect_from_forgery with: :exception
  authem_for :user

  def set_notice
    specific_message = params[:notice]
    @notice_message = "Sign Up Successful" if specifice_message = "successful_sign_up"
  end

end
