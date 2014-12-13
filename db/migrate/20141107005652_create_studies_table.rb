class CreateStudiesTable < ActiveRecord::Migration
  def change
  	create_table :studies do |s|
  		s.string :title
  		s.text :description
  		s.integer :max_participants, :default => 30
  		s.string :duration
  		s.integer :credits, :default => 1
      s.timestamps
  	end
  end
end
