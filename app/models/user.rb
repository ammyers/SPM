class User < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :email, :password, :role, :paper_option

  validates :first_name, :last_name, :email, :password, presence: true

  has_and_belongs_to_many :created_studies, join_table: "researchers", class_name: "Study"

  has_and_belongs_to_many :studytimes, join_table: "participants"

  has_and_belongs_to_many :completedstudies, join_table: "completions", class_name: "Studytime"

  has_and_belongs_to_many :courses, join_table: "studentcourses"

  before_save :capitalize_name

  def capitalize_name
  	self.first_name = self.first_name.capitalize
  	self.last_name = self.last_name.capitalize
  end

  def paper_yes_or_no
  	if (self.paper_option == true) 
  		return "Yes"
  	else 
  		return "No"
  	end
  end



  def admin?
  	if (self.role == "admin") 
  		return true
  	else 
  		return false
  	end
  end

  def name
    return self.first_name + " " + self.last_name
  end

end