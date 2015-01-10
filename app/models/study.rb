class Study < ActiveRecord::Base
  attr_accessible :title, :description, :max_participants, :duration, :credits

  has_and_belongs_to_many :researchers, join_table: "researcher_studies", class_name: "User"

  has_many :studytimes, dependent: :destroy

  validates :title, :duration, presence: true 
  validates :credits, :max_participants, :numericality => {:greater_than_or_equal_to => 1}
end