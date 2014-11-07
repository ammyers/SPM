class CreateStudiesTimesTable < ActiveRecord::Migration
  def up
  	create_table :study_times do |s|
  		s.integer :study_ID
  		s.datetime :time
  	end
  end

  def down
  end
end
