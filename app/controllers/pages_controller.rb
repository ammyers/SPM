class PagesController < ApplicationController
  def login
  	# This is the public facing login page.
  	# No specific info is needed at this time, we'll just show some HTML
  	# (located in views/page/login)

  	# let's just set the sessions variables if they are nil
  	if session[:role].nil?
  		session[:role] = 'none'
  	end
  	if session[:id].nil?
    	session[:id] = 99999
	end

	if session[:logged_in].nil?
		session[:logged_in] = false
	end
  end
end
