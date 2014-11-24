#this database connects studies with researchers
class CreateResearchersTable < ActiveRecord::Migration
  def change
  	create_table :researchers, :id => false do |s|
  		s.references :user
  		s.references :study
  	end
  end
end
