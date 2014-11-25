class User < ActiveRecord::Base
  attr_protected :uid, :provider #for omniauth authentication
  attr_accessible :first_name, :last_name, :email, :password, :role, :name, :member_of #ups data fields

  validates :first_name, :last_name, :email, presence: true

  has_and_belongs_to_many :created_studies, join_table: "researchers", class_name: "Study"

  has_and_belongs_to_many :studytimes, join_table: "participants"

  has_and_belongs_to_many :completedstudies, join_table: "completions", class_name: "Studytime"

  before_save :capitalize_name

  def capitalize_name
  	self.first_name = self.first_name.capitalize
  	self.last_name = self.last_name.capitalize
  end

  def full_name
    first_name + " " + last_name
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
  		:member_of => auth["info"]["memberOf"]
  	)
    
    # if user.faculty?
    #   :role => "admin"
    # elsif user.student?
    #   :role => "researcher"
    # end
        
    user.provider = auth["provider"]
    user.uid = auth["uid"]
    user.save!
    return user
  end
end