class Study < ActiveRecord::Base
  attr_accessible :title, :description, :max_participants, :special_instructions

  belongs_to :researcher, class_name: "Person", foreign_key: "created_studies", association_foreign_key: "id"

  #has_many :date_time

  has_and_belongs_to_many :participants, class_name: "Person"

  #validates :title, :person, presence: true
  #validates :date_time, presence: true

  before_save :capitalize_title
  	
  def capitalize_title
  	self.title = self.title.capitalize
  end
end