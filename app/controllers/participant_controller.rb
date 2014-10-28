class ParticipantController < ApplicationController
  def login
  end

  def my_studies
  end

  def all_studies
    @studies = Study.all 
  end

  def profile
  end

  def create_study
  end

  def study_details
  end
end
