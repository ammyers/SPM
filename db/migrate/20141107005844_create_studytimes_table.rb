class CreateStudytimesTable < ActiveRecord::Migration
  def up
  	create_table :studytimes do |t|
      t.datetime :datetime
      t.belongs_to :study
      t.timestamps
 	 end
  end

  def down
  end
end