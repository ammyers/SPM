class PagesController < ApplicationController
  def login
  	if params[:logout]
  		flash.alert = "You have been logged out"
  		redirect_to root_path
  	end

  	if session[:id]
  		session.delete :id
  	end
  end
end