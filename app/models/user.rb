class User < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :email, :password, :role

  validates :first_name, :last_name, :email, :password, presence: true

  has_and_belongs_to_many :created_studies, join_table: "researchers", class_name: "Study"

  has_and_belongs_to_many :studytimes, join_table: "participants"

  before_save :capitalize_name

  def capitalize_name
  	self.first_name = self.first_name.capitalize
  	self.last_name = self.last_name.capitalize
  end
end