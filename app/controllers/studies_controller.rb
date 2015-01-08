class StudiesController < ApplicationController

  def show
    @study = Study.find(params[:id]) # look up study by unique ID
    # will render app/views/studys/show.<extension> by default
    @mine = @me.created_studies.include? @study
    # true if the user has already joined a section of this study
    @hasjoined = false
    @me.studytimes.each do |st|
      @hasjoined = true if st.study == @study
    end
  end

  def index
    # shuffles studies to reduce preferential choosing
    @studies = Study.all.shuffle
    #paginate(:per_page => 5, :page => params[:page])
  end

  def new
    # default
    if !@me.researcher?
      flash.alert = "Only researchers can create studies"
      redirect_to studies_path
    end
  end

  def create
    @study = Study.new(params[:study])
    studytime = Studytime.new(params[:studytime])
    @study.studytimes << studytime
    studytime.study = @study
    @me.created_studies << @study
    studytime.save!
    @study.save!

    flash.alert = "#{@study.title} was successfully created."
    redirect_to study_path(@study)
  end

  def edit
    @study = Study.find params[:id]
    @studytimes = @study.studytimes
    @mine = @me.created_studies.include? @study
    if !@mine
      flash.alert = "This is not your study, unable to edit"
      redirect_to study_path(@study)
    end
  end

  def update
    @study = Study.find params[:id]
    @study.update_attributes!(params[:study])
    if params[:studytime]
      @studytime = Studytime.new(params[:studytime])
      @study.studytimes << @studytime
      @studytime.study = @study
      @studytime.save
      @study.save
    end
    flash.alert = "#{@study.title} was successfully updated."
    redirect_to study_path(@study)
  end

  def destroy
    @study = Study.find(params[:id])
    studytimes = Studytime.where(study_id: @study.id)
    @study.destroy
    studytimes.each do |st|
      st.destroy
    end
    flash.alert = "Study '#{@study.title}' deleted."
    redirect_to studies_path
  end

  def join
    @me.studytimes << Studytime.find(params[:studytime])
    count = @me.studytimes.size
    # if (count < 1)
    #   flash.alert = "You are now registered for #{count} studies"
    # end
    flash.alert = "You are now registered for #{count} study"
    redirect_to users_my_studies_path
  end

  def leave
    studytime = Studytime.find(params[:studytime])
    @me.studytimes.delete(studytime)
    flash.alert = "You have left #{studytime.study.title}"
    if params[:path] == 'from_show'
      redirect_to study_path(studytime.study)
    else
      redirect_to users_my_studies_path
    end
  end

  def attendance
    @time = Studytime.find_by_id(params[:study_time_id])
    # @mine = @me.created_studies.include? @time
    # if (!@mine || !@me.admin?)
    #   flash.alert = "Unable to Access"
    #   redirect_to studies_path
    # end

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
    user.credits += studytime.study.credits
    user.save!()
    redirect_to studies_attendance_path(studytime.id)
  end
end