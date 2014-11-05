class AddResearcherToStudies < ActiveRecord::Migration
  def up
  	change_table :studies do |t|
		  t.belongs_to :researcher, class_name: "User"
    end
  end

  def down
  	change_table :studies do |t|
  		t.remove :researcher_id
  	end
  end
end
