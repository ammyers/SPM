class AddCreatedStudyToResearcher < ActiveRecord::Migration
  def up
  	change_table :users do |p|
  		p.has_many :created_studies, class_name: "Study"
  	end
  end

  def down
  	change_table :users do |p|
  		p.remove :created_studies
  	end
  end
end
