class Studytime < ActiveRecord::Base
  attr_accessible :datetime, :location

  belongs_to :study

  has_and_belongs_to_many :participants, join_table: "participants", class_name: "User"

  has_and_belongs_to_many :completees, join_table: "completions", class_name: "User"

  before_save :confirm_location

  def confirm_location
  	self.location = "UNKNOWN" if self.location.nil?
  end

  def toString
  	return self.datetime.strftime("%A %b %e, %l:%M %p") + " in " + self.location
  end

end