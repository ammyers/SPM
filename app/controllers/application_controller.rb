class ApplicationController < ActionController::Base
  protect_from_forgery

  def get_user
    if session[:id]
      return User.find(session[:id])
    end
  end
end