class ApplicationController < ActionController::Base
  before_action :set_notice
  protect_from_forgery with: :exception
  authem_for :user

  def set_notice
    alert = params[:notice]

    if alert == ("successful_sign_up") || ("successful_sign_in") || ("successful_sign_out")
      @alert_class = "flash-success"
    end

    @alert_message = "Sign Up Successful" if alert == "successful_sign_up"
    @alert_message = "Sign In Successful" if alert == "successful_sign_in"
    @alert_message = "Signed Out" if alert == "successful_sign_out"
  end

end
