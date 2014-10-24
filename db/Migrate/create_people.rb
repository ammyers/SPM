class CreatePeople < ActiveRecord::Migration
  def up
    create_table :people do |t|
      t.string :first_name
      t.string :last_name
      # Add fields that let Rails automatically keep track
      # of when movies are added or modified:
      t.timestamps
    end
  end

  def down
    drop_table :people
  end
end