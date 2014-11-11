class Studytime < ActiveRecord::Base
  attr_accessible :datetime

  belongs_to :study

  has_and_belongs_to_many :participants, join_table: "Participants", class_name: "User"
end