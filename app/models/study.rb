class Study < ActiveRecord::Base
  attr_accessible :title, :description, :max_participants, :special_instructions

  #has_one :researcher

  #has_many :date_time

  has_and_belongs_to_many :participants

  #validates :title, :researchers, :date_time, presence: true

  before_save :capitalize_title
  	
  def capitalize_title
  	self.title = self.title.capitalize
  end
end