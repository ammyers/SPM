class AddCreatedStudyToResearcher < ActiveRecord::Migration
  def up
  	change_table :people do |p|
  		p.belongs_to :study
  	end
  end

  def down

  end
end
