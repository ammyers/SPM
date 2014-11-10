class CreateStudiesTable < ActiveRecord::Migration
  def up
  	create_table :studies do |s|
  		s.string :title
  		s.text :description
  		s.integer :max_participants, :default => 30
  		s.string :duration
  	end
  end

  def down
  end
end
