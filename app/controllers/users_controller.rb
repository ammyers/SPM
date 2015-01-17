class UsersController < ApplicationController

  def show
    @user = User.find(params[:id]) # look up user by unique ID
    @mine = (@me == @user)
    @admin = @me.admin?
    @havesignedup = !@user.studytimes.empty?

    # if !@mine | @admin
    #   flash.alert = "Unable to access"
    #   redirect_to studies_path
    # end
  end

  def index
    # If not admin, redirect to Studies page
    if !@me.admin?
      flash.alert = "Not an admin, unable to access"
      redirect_to studies_path
    end
    @sort = User.ransack(params[:q])
    # Only want students
    @users = @sort.result.where("role != 'admin'").paginate(:per_page => 5, :page => params[:page])
    # @sort.build_condition if @sort.conditions.empty?
    # @sort.build_sort if @sort.sorts.empty?
  end

  def my_studies
    @my_studytimes = @me.studytimes
    redirect_to studies_path if @my_studytimes.empty?
    #flash.alert = "You have no studies"
  end

  def created_studies
    if(params[:selected_studytime])
      redirect_to studies_attendance_path(params[:selected_studytime])
    end
    
    @studies = @me.created_studies
  end

  def new
    # If not admin, redirect to Studies page
    if (!@me.admin?)
      flash.alert = "Not an admin, unable to access"
      redirect_to studies_path
    end
  end

  def create
    @user = User.create!(params[:user])
    redirect_to users_path
  end

  def edit
    @user = User.find params[:id]
    @courses = @user.courses
    @all_courses = Course.all
    # If not my account, redirect to Studies page
    if @user != @me
      flash.alert = "Not your account, unable to access"
      redirect_to studies_path
    end
  end

  def admins
    # If not admin, redirect to Studies page
    if !@me.admin?
      flash.alert = "Not an admin, unable to access"
      redirect_to studies_path
    end
    @sort = User.ransack(params[:q])
    @users = @sort.result.where("role == 'admin'")
  end

  # setup page similar to edit page
  def setup
    # If account setup, redirect to Studies page
    # if @me.setup
    #   flash.alert = "Error: Page not accessible"
    #   redirect_to studies_path
    # end
  end

  # page to add a course, accessible for the edit page
  def addcourse
    @courseOptions = Course.all
    @me.courses.each do |mine|
      @courseOptions.delete(mine)
    end
  end

  def joincourse
    course = Course.find(params[:course])
    @me.courses << course unless @me.courses.include? course
    flash.alert = "Joined #{course.section}"
    redirect_to user_path(@me)
  end

  def leavecourse
    course = Course.find(params[:course])
    @me.courses.delete(course)
    flash.alert = "Left #{course.section}"
    redirect_to user_path(@me)
  end

  def update
    @user = User.find(params[:id])
    params[:user][:setup] = true
    @user.update_attributes(params[:user])
    @user.setup = true
    @user.save
    #courseparams = params[:user][:courses]
    flash.alert = "Account updated."
    redirect_to user_path(@user)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash.alert = "user #{@user.full_name} deleted."
    redirect_to root_path
  end
end