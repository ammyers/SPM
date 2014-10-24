class CreateStudies < ActiveRecord::Migration
  def up
    create_table :studies do |t|
      t.string :title
      t.text :description
      t.datetime :date_time
      # Add fields that let Rails automatically keep track
      # of when movies are added or modified:
      t.timestamps
    end
  end

  def down
    drop_table :studies
  end
end