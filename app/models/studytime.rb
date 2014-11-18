class Studytime < ActiveRecord::Base
  attr_accessible :datetime, :location

  belongs_to :study

  has_and_belongs_to_many :participants, join_table: "participants", class_name: "User"
end
