class Course < ActiveRecord::Base
  attr_accessible :section, :instructor

  has_and_belongs_to_many :students, join_table: "studentcourses", class_name: "User"
end