class CreateStudiesTable < ActiveRecord::Migration
  def up
  	create_table :studies do |s|
      p.string :title
      p.string :description
      p.int :max_participants
      p.string :special_instructions

      p.timestamps
    end
  end

  def down
  	drop_table :studies
  end
end
