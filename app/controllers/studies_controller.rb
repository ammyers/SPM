class StudiesController < ApplicationController

# @me unnecessary because of :set_current_user being performed in application controller 

  def show
    #@me = get_user
    id = params[:id] # retrieve study ID from URI route
    @study = Study.find(id) # look up study by unique ID
    # will render app/views/studys/show.<extension> by default
  end

  def index
    #@me = get_user
    @studies = Study.all
  end

  def new
    #@me = get_user
    # default: render 'new' template
  end

  def create
    #@me = get_user
    @study = Study.new(params[:study])
    studytime = Studytime.new(params[:time_slot])
    @study.studytimes << studytime
    @study.save!
    flash[:notice] = "#{@study.title} was successfully created."
    redirect_to studies_path
  end

  def edit
    #@me = get_user
    @study = Study.find params[:id]
  end

  def update
    #@me = get_user
    @study = Study.find params[:id]
    @study.update_attributes!(params[:study])
    flash[:notice] = "#{@study.title} was successfully updated."
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

  def attendance
    @me = get_user
    puts @me.completedstudies
    @time = Studytime.find_by_id(params[:studyTime])
    @study = @time.study

    #make a hash of participants => if they have completed this study/time
    @participants = {} #user.id => boolean


    temp = User.find_by_id(1)
    #@participants[temp] = false

    # if(temp.completedstudies.includes?(@time.id))
    #   puts "blah"
    # else
    #   puts "yay"
    # end

    #for all of the participants of this study
    @time.participants.each do |p|
      # look at all their completed studies
      if (p.completedstudies == [])
        puts "no completedstudies"
        @participants[p] = false
        next
      end
      p.completedstudies.each do |s|
        puts "**********"
        p "heelo"
        puts s
        puts @time.id
        puts "**********"
        #if they have completed this study
        if (s == @time.id)
          #return true
          @participants[p] = true
          return
        end
      #if you get here, they haven't completed this study so value = false
      @participants[p] = false
      end
    end
    puts "**********"
    puts @participants
    puts "**********"

  end

  def confirm_attendance
    user = User.find_by_id(params[:person_id])
    studytime = params[:studytimes]
    user.completedstudies << studytime
    user.save!()
   redirect_to users_start_study_path
  end
end