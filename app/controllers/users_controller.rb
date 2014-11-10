class UsersController < ApplicationController
  def show
    id = params[:id] # retrieve user ID from URI route
    @user = User.find(id) # look up user by unique ID
    # will render app/views/users/show.<extension> by default
  end

  def index
    @me = get_user
    @users = User.all 
  end

  def my_studies
    @me = get_user
    @my_studies = @me.studies
  end

  def login
    if params
      theEmail = params[:email]
      thePassword = params[:password]
      me = User.find_by_email(theEmail)
      if me && thePassword == me.password
        session[:id] = me.id
        if me.role == 'admin'
          redirect_to users_path
        else
          redirect_to studies_path
        end
      else
        flash.alert = "Invalid login credentials"
        redirect_to root_path
      end
    end
  end

  def new
    # default: render 'new' template
  end

  def create
    @user = User.create!(params[:user])
    flash[:notice] = "#{@user.title} was successfully created."
    redirect_to users_path
  end

  def edit
    @movie = User.find params[:id]
  end

  def update
    @user = User.find params[:id]
    @user.update_attributes!(params[:user])
    flash[:notice] = "#{@user.title} was successfully updated."
    redirect_to user_path(@user)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "user '#{@user.title}' deleted."
    redirect_to users_path
  end
end