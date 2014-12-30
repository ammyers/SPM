class RenameParticipantsTable < ActiveRecord::Migration
  def change
  	rename_table :participants, :participant_studies
  end
end
