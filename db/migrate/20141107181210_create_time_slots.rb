class CreateTimeSlots < ActiveRecord::Migration
  def change
    create_table :time_slots do |t|
      t.datetime :time
      t.references :study
      t.timestamps
    end
  end
end
