class User < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :email, :password, :role

  #validates :first_name, :last_name, :email, :password, presence: true

  has_and_belongs_to_many :studies, join_table: "Participants"

  has_many :classes

  has_and_belongs_to_many :created_studies, join_table: "Researchers", class_name: "Study"

  def capitalize_name
  	self.first_name = self.first_name.capitalize
  	self.last_name = self.last_name.capitalize
  end
end