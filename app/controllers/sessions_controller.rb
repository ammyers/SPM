class SessionsController < ApplicationController
  before_filter :restrict_to_development, :only => [:test_login]

  skip_before_filter :set_current_user #don't check for the user when authenticating

  #login
  def create
    auth = request.env["omniauth.auth"]
    user = User.find_by_provider_and_uid(auth["provider"],auth["uid"]) || User.create_with_omniauth(auth)
    session[:user_id] = user.id
    if user.role == 'researcher' && user.courses == []
    redirect_to studies_path #where go to when logged in
  end

  #logout
  def destroy
    session.delete(:user_id)
    flash.alert = 'Logged out successfully.'
    redirect_to root_path #where to go to when logged out
  end
end