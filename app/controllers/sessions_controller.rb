class SessionsController < ApplicationController
  before_filter :restrict_to_development, :only => [:test_login]

  skip_before_filter :set_current_user #don't check for the user when authenticating

  #login
  def create
    auth = request.env["omniauth.auth"]
    user = User.find_by_provider_and_uid(auth["provider"],auth["uid"]) || User.create_with_omniauth(auth)
    session[:user_id] = user.id
    redirect_to users_edit_path #where go to when logged in
  end

  #logout
  def destroy
    session.delete(:user_id)
    flash[:notice] = 'Logged out successfully.'
    redirect_to login_path #where to go to when logged out
  end

  #for testing -- DELETE THIS FOR PRODUCTION
  def test_login
    user = User.find(params[:user_id])
    session[:user_id] = user.id

    redirect_to studies_path #where go to when logged in
  end

end