class User < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :email, :password, :role

  #validates :first_name, :last_name, :email, :password, presence: true

  has_and_belongs_to_many :studies

  has_many :classes

  has_many :created_studies, class_name: "Study", foreign_key: "researcher_id"

  def capitalize_name
  	self.first_name = self.first_name.capitalize
  	self.last_name = self.last_name.capitalize
  end
end