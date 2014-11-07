#this database connects studies with researchers
class CreateResearchersTable < ActiveRecord::Migration
  def up
  	create_table :researchers do |s|
  		s.references :user
  		s.references :study
  	end
  end

  def down
  end
end
