class CreateCoursesTable < ActiveRecord::Migration
  def up
  	create_table :courses do |c|
    	c.string :section
    	c.string :instructor
    	c.timestamps
  	end
  end

  def down
  end
end
