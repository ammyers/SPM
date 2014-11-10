class StudiesController < ApplicationController

  def show
    @me = get_user
    id = params[:id] # retrieve study ID from URI route
    @study = Study.find(id) # look up study by unique ID
    # will render app/views/studys/show.<extension> by default
  end

  def index
    @me = get_user
    @studies = Study.all
  end

  def new
    @me = get_user
    # default: render 'new' template
  end

  def create
    @me = get_user
    @study = Study.create!(params[:study])
    flash[:notice] = "#{@study.title} was successfully created."
    redirect_to studies_path
  end

  def edit
    @me = get_user
    @study = Study.find params[:id]
  end

  def update
    @me = get_user
    @study = Study.find params[:id]
    @study.update_attributes!(params[:study])
    flash[:notice] = "#{@study.title} was successfully updated."
    redirect_to study_path(@study)
  end

  def destroy
    @me = get_user
    @study = Study.find(params[:id])
    @study.destroy
    flash[:notice] = "Study '#{@study.title}' deleted."
    redirect_to studies_path
  end
end