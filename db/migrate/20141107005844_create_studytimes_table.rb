class CreateStudytimesTable < ActiveRecord::Migration
  def change
  	create_table :studytimes do |t|
      t.datetime :datetime
      t.string :location
      t.belongs_to :study
      t.timestamps
 	 end
  end
end