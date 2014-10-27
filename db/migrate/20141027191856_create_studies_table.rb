class CreateStudiesTable < ActiveRecord::Migration
  def up
  	create_table :studies do |s|
      s.string :title
      s.text :description
      s.integer :max_participants, :default => 30
      s.text :special_instructions

      s.timestamps
    end
  end

  def down
  	drop_table :studies
  end
end
