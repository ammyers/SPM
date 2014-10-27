class CreateStudiesTable < ActiveRecord::Migration
  def up
  	create_table :studies do |s|
      s.string :title
      s.string :description
      s.integer :max_participants
      s.string :special_instructions

      s.timestamps
    end
  end

  def down
  	drop_table :studies
  end
end
