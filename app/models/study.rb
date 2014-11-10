class Study < ActiveRecord::Base
  attr_accessible :title, :description, :max_participants, :duration

  has_and_belongs_to_many :researchers, join_table: "Researchers", class_name: "User"

  has_many :studytimes

  validates :title, presence: true

  before_save :capitalize_title
  	
  def capitalize_title
  	self.title = self.title.capitalize
  end
end