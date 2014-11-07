class StudiesController < ApplicationController

  def show
    id = params[:id] # retrieve study ID from URI route
    @study = Study.find(id) # look up study by unique ID
    # will render app/views/studys/show.<extension> by default
  end

  def index
    session[:role] = 'none'
    session[:id] = 999
    if (params[:email])
      me = User.find_by email: params[:email]
      session[:role] = me.role
      session[:id] = me.id
    end
    @studies = Study.all
    @id = session[:id]
    @role = session[:role] 
  end

  def new
    # default: render 'new' template
  end

  def create
    @study = Study.create!(params[:study])
    flash[:notice] = "#{@study.title} was successfully created."
    redirect_to studies_path
  end

  def edit
    @study = Study.find params[:id]
  end

  def update
    @study = Study.find params[:id]
    @study.update_attributes!(params[:study])
    flash[:notice] = "#{@study.title} was successfully updated."
    redirect_to study_path(@study)
  end

  def destroy
    @study = Study.find(params[:id])
    @study.destroy
    flash[:notice] = "Study '#{@study.title}' deleted."
    redirect_to studies_path
  end
end