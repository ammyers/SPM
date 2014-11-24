# This table connect participants with their studytimes
class CreateParticipantsTable < ActiveRecord::Migration
  def change
  	create_table :participants, :id => false do |s|
  		s.references :studytime
  		s.references :user
  	end
  end
end
