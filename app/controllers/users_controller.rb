class UsersController < ApplicationController

  # @me unnecessary because of :set_current_user being performed in application controller 
  def show
    #@me = get_user
    id = params[:id] # retrieve user ID from URI route
    @user = User.find(id) # look up user by unique ID
  end

  def index
    #@me = get_user
    #if not an admin, redirect
    if @me.role != 'admin'
      redirect_to studies_path
    end

    #set variable to being all courses
    @all_courses = Course.all

    #1. we only want students
    @users = User.where("role == 'participant' OR role == 'researcher'")

    #2. filter by course
      #if null or all_courses, include everyone - no filter
      #if specific course selected, show only people in that class
    if (params[:courses] != "All Courses" && params[:courses] != nil)
      @users.select!() do |user| # get list of users who have courses that match
        temp = user.courses.select() do |course| # get list of courses that have same id
          course.id.to_s == params[:courses]
        end
        temp.length > 0 # return if are some courses
      end
    end

    #3. sort by selection
    if (params[:sort_by] == nil)
      @users.sort!() {|a, b| -1*(a.last_name <=> b.last_name) }
    elsif (params[:sort_by] == "signedupfor")
      @users.sort!() {|a, b| -1*(a.studytimes.size <=> b.studytimes.size) }
    elsif (params[:sort_by] == "completedstudies" )
      @users.sort!() {|a, b| -1*(a.completedstudies.size <=> b.completedstudies.size) }
    else
      @users.sort!() {|a, b| (a.send(params[:sort_by]) <=> b.send(params[:sort_by]) ) } 
    end

    #remembering filter (courses)
    if @sort_by !=nil
      session[:sort_by] = @sort_by
    end
    
    if session[:courses] != @selected_courses && @selected_courses != nil
      session[:courses] = @selected_courses
    end

    if session[:courses] == nil
      @selected_courses = @all_courses
    else
      @selected_courses = session[:courses]
    end
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