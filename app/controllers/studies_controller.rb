class StudiesController < ApplicationController

  def show
    id = params[:id] # retrieve study ID from URI route
    @study = Study.find(id) # look up study by unique ID
    # will render app/views/studys/show.<extension> by default
  end

  def index
    @me = get_user
    @studies = Study.all
  end

  def new
    # default: render 'new' template
  end

  def create
    @study = Study.create!(params[:study])
    #:study.time_slots each do |t|
      #time_slots.new(t, :study)
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