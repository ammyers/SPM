class CreateStudiesTable < ActiveRecord::Migration
  def up
  	create_table :studies do |s|
      s.string :title
      s.string :researchers
      s.string :email
      s.text :description
      s.integer :max_participants, :default => 30
      s.integer :length_of_study
      
      s.timestamps
    end
  end

  def down
  	drop_table :studies
  end
end
