class StudiesController < ApplicationController

# @me unnecessary because of :set_current_user being performed in application controller 

  def show
    @study = Study.find(params[:id]) # look up study by unique ID
    # will render app/views/studys/show.<extension> by default
    @mine = @me.created_studies.include? @study
  end

  def index
    @studies = Study.all
  end

  def new
    # default: render 'new' template
  end

  def create
    @study = Study.new(params[:study])
    studytime = Studytime.new(params[:studytime])
    @study.researchers << @me
    @study.studytimes << studytime
    @study.save!

    flash.alert = "#{@study.title} was successfully created."
    redirect_to studies_path
  end

  def edit
    @study = Study.find params[:id]
    @studytimes = @study.studytimes
  end

  def update
    @study = Study.find params[:id]
    @study.update_attributes!(params[:study])
    flash.alert = "#{@study.title} was successfully updated."
    redirect_to study_path(@study)
  end

  def destroy
    #@me = get_user
    @study = Study.find(params[:id])
    @study.destroy
    flash[:notice] = "Study '#{@study.title}' deleted."
    redirect_to studies_path
  end

  def join
    #@me = get_user
    @me.studytimes << Studytime.find(params[:studytime])
    count = @me.studytimes.size
    flash.alert = "You are now registered for #{count} studies"
    redirect_to users_my_studies_path
  end

  def leave
    studytime = Studytime.find(params[:studytime])
    @me.studytimes.delete(studytime)
    flash.alert = "You have left #{studytime.study.title}"
    redirect_to users_my_studies_path
  end

  def attendance
    @time = Studytime.find_by_id(params[:study_time_id])
    @study = @time.study

    #make a hash of participants => if they have completed this study/time
    @participants = {} #user.id => boolean

    p @time.participants

    #for all of the participants of this study
    @time.participants.each do |p|
      # look at all their completed studies
      @participants[p] = false
      # if (p.completedstudies == [])
      #   @participants[p] = false
      #   next
      # end
      p.completedstudies.each do |studytime|
        #if they have completed this study
        if (studytime.id == @time.id)
          #return true
          @participants[p] = true
        end
        #if you get here, they haven't completed this study so value = false
      end

    end

    p @participants

  end

  def confirm_attendance
    user = User.find_by_id(params[:person_id])
    studytime = Studytime.find_by_id(params[:time_id])
    user.completedstudies << studytime
    user.save!()
   redirect_to studies_attendance_path(studytime.id)
  end
end