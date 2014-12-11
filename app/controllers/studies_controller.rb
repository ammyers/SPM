class StudiesController < ApplicationController

  def show
    @me = get_user
    @study = Study.find(params[:id]) # look up study by unique ID
    # will render app/views/studys/show.<extension> by default
    @mine = @me.created_studies.include? @study
  end

  def index
    @me = get_user
    @studies = Study.all
  end

  def new
    #@me = get_user
    # default: render 'new' template
  end

  def create
    #@me = get_user
    @study = Study.new(params[:study])
    studytime = Studytime.new(params[:studytime])
    @study.studytimes << studytime
    @study.save!

    # params[:study].time_slots each do |t|
    #   time_slots.new(t, :study)
    flash.alert = "#{@study.title} was successfully created."
    redirect_to studies_path
  end

  def edit
    @me = get_user
    @study = Study.find params[:id]
    @studytimes = @study.studytimes
  end

  def update
    @me = get_user
    @study = Study.find params[:id]
    @study.update_attributes!(params[:study])
    flash.alert = "#{@study.title} was successfully updated."
    redirect_to study_path(@study)
  end

  def destroy
    @me = get_user
    @study = Study.find(params[:id])
    @study.destroy
    flash[:notice] = "Study '#{@study.title}' deleted."
    redirect_to studies_path
  end

  def join
    @me = get_user
    @me.studytimes << Studytime.find(params[:studytime])
    count = @me.studytimes.size
    flash.alert = "You are now registered for #{count} studies"
    redirect_to users_my_studies_path
  end

  def leave
    times = get_user.studytimes
    studytime = Studytime.find(params[:studytime])
    times.delete(studytime)
    flash.alert = "You have left #{studytime.study.title}"
    redirect_to users_my_studies_path
  end
end