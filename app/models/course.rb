class Course < ActiveRecord::Base
  attr_accessible :section, :instructor

  has_and_belongs_to_many :students, join_table: "studentcourses", class_name: "User"

  def to_s ## this should be called something like "title"; we don't use to_s in ruby
  	return "PSYC #{self.section} - #{self.instructor}"
  end
end