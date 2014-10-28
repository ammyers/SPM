class AddResearcherAndParticipantsToStudies < ActiveRecord::Migration
  def change
  	change_table :studies do |s|
  		s.integer :researcher_id
  		s.references :participants
  	end
  end
end
