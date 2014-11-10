class Study < ActiveRecord::Base
  attr_accessible :title, :description, :max_participants, :length

  has_and_belongs_to_many :researchers, join_table: "Researchers", class_name: "User"

  has_many :time_slots

  has_and_belongs_to_many :participants, join_table: "Participants", class_name: "User"

  #validates :title, presence: true
  #validates :date_time, :researcher, presence: true
  	
  def capitalize_title
  	self.title = self.title.capitalize
  end
end