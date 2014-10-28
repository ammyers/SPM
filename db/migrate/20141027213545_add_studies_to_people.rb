class AddStudiesToPeople < ActiveRecord::Migration
  def change
  	add_references :people :studies
  end
end
