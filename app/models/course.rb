class Course < ActiveRecord::Base
  attr_accessible :section, :instructor

  has_and_belongs_to_many :students, join_table: "studentcourses", class_name: "User"

  def toString ## this should be called something like "title"; we don't use toString in ruby
  	return "PSYC #{self.section} - #{self.instructor}"
  end
end