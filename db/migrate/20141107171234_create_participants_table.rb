#connects participants and studies - for each participant, for each study a participant is in, there is a line in this database
class CreateParticipantsTable < ActiveRecord::Migration
  def up
  	create_table :participants, :id => false do |s|
  		s.references :user
  		s.references :study
  	end
  end

  def down
  end
end
