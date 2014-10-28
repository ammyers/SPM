class AddResearcherToStudies < ActiveRecord::Migration
  def up
  	change_table :studies do |t|
		t.references :researcher
	end
  end

  def down
  	change_table :studies do |t|
  		t.remove :researcher_id
  	end
  end
end
