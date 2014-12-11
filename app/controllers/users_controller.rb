class UsersController < ApplicationController

  # @me set using :set_current_user being performed in application controller 
  def show
    @user = User.find(params[:id]) # look up user by unique ID
    @mine = (@me == @user)
    @admin = (@me.role == 'admin')
  end

  def index
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
    @user = User.find params[:id]
    @courses = @user.courses
  end

  # setup page similar to edit page
  def setup
    #@me set
    @courses = @me.courses
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(params[:user])
    courseparams = params[:user][:courses]
    flash.alert = "Account updated."
    redirect_to user_path(@user)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash.alert = "user #{@user.full_name} deleted."
    redirect_to users_path
  end
end