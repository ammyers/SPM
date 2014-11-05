class UsersController < ApplicationController
  
  def show
    id = params[:id] # retrieve study ID from URI route
    @study = User.find(id) # look up user by unique ID
    # will render app/views/users/show.<extension> by default
  end

  def index
    @studies = User.all 
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
    flash[:notice] = "user '#{@study.title}' deleted."
    redirect_to users_path
  end
end