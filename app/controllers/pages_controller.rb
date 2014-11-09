class PagesController < ApplicationController
  def login
  	if params[:logout]
  		flash.alert = "You have been logged out"
  		redirect_to root_path
  	end

  	if session[:id]
  		session.delete :id
  	end
  	if session[:role]
  		session.delete :role
  	end
  	session[:logged_in] = false
  end
end
