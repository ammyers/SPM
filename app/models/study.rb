class Study < ActiveRecord::Base
  attr_accessible :title, :description, :id, :max_participants, :special_instructions

  validates :title, :researchers, :date_time, presence: true

  has_many :researchers, :participants, :date_time

  before_save :capitalize_title
  	
  def capitalize_title
  	self.title = self.title.capitalize
  end
end