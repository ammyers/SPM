class Person < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :email, :password, :role

  validates :first_name, :last_name, :email, :password, presence: true

  has_and_belongs_to_many :studies

  #has_many :classes, :created_studies

  before_save :capitalize_name

  def capitalize_name
  	self.first_name = self.first_name.capitalize
  	self.last_name = self.last_name.capitalize
  end

end