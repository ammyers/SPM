class Study < ActiveRecord::Base
  attr_accessible :title, :description, :max_participants, :duration, :credits

  has_and_belongs_to_many :researchers, join_table: "researcher_studies", class_name: "User"

  has_many :studytimes

  validates :title, presence: true
end