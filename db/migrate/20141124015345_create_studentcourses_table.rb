# This table connects users to the courses that they are students in
class CreateStudentcoursesTable < ActiveRecord::Migration
  def up
  	create_table :studentcourses, :id => false do |s|
  		s.references :user
  		s.references :course
  	end
  end

  def down
  end
end
