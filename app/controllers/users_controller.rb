class UsersController < ApplicationController

  # @me unnecessary because of :set_current_user being performed in application controller 
  def show
    #@me = get_user
    @user = User.find(params[:id]) # look up user by unique ID
    @mine = (@me == @user)
    @admin = (@me.role == 'admin')
  end

  def index
    #@me = get_user
    if @me.role != 'admin'
      redirect_to studies_path
    end
    @users = User.all 
  end

  def my_studies
    #@me = get_user
    @my_studytimes = @me.studytimes
  end

  def created_studies
    #@me = get_user
    @studies = @me.created_studies
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
        flash.alert = "INVALID LOGIN CREDENTIALS"
        redirect_to root_path
      end
    end
  end

  def new
    #@me = get_user
    # default: render 'new' template
  end

  def create
    #@me = get_user
    @user = User.create!(params[:user])
    redirect_to users_path
  end

  def edit
    #@me = get_user
    @user = User.find params[:id]
    @courses = @user.courses
  end

  def update
    #@me = get_user
    @user = User.find(params[:id])
    @user.update_attributes params[:user]
    flash.alert = "#{@user.first_name} #{@user.last_name} was successfully updated."
    redirect_to user_path(@user)
  end

  def destroy
    #@me = get_user
    @user = User.find(params[:id])
    @user.destroy
    flash.alert = "user #{@user.first_name} #{@user.last_name} deleted."
    redirect_to users_path
  end
end