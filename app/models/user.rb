class User < ActiveRecord::Base

  attr_protected :uid, :provider #for omniauth authentication
  attr_accessible :first_name, :last_name, :email, :role, :name, :member_of, :paper_option, :setup, :credits

  validates :first_name, :last_name, :email, presence: true

  has_and_belongs_to_many :created_studies, join_table: "researcher_studies", class_name: "Study"

  has_and_belongs_to_many :studytimes, join_table: "participant_studies"

  has_and_belongs_to_many :completedstudies, join_table: "completions", class_name: "Studytime"

  has_and_belongs_to_many :courses, join_table: "studentcourses"

  before_save :capitalize_name

  def capitalize_name
  	self.first_name = self.first_name.capitalize
  	self.last_name = self.last_name.capitalize
  end

  def full_name
    self.first_name + " " + self.last_name
  end

  # is a faculty member?
  def faculty?
  	member_of.downcase.include? "faculty"
  end

  # is a student?
  def student?
  	member_of.downcase.include? "student"
  end

  # creates a new user from the given omniauth authorization
  def self.create_with_omniauth(auth)
    user = User.new(
    	:name => auth["info"]["name"],
  		:email => auth["info"]["email"],
  		:last_name => auth["info"]["last_name"],
  		:first_name => auth["info"]["first_name"],
  		:member_of => auth["info"]["memberOf"],
      :setup => false
  	)

    # Instead of assigning students automatically to a role
    # this will be done on the user_setup page
    user.role = 'unspecified'

    # if user is a faculty member, auto assigned admin role
    if (user.faculty?)
      user.role = 'admin'
    end

    user.provider = auth["provider"]
    user.uid = auth["uid"]
    user.save!
    return user
  end

  def paper_yes_or_no
  	if (self.paper_option == true) 
  		return "Yes"
  	else 
  		return "No"
  	end
  end

  def admin?
  	return (self.role == "admin") 
  end

  def researcher?
    return (self.role == "researcher")
  end

  def participant?
    return (self.role == "participant")
  end

  def name
    return self.first_name + " " + self.last_name
  end

end