class AddResearcherToStudies < ActiveRecord::Migration
  def change
  	add_belongs_to :studies :researcher 
  end
end
