class Studytime < ActiveRecord::Base
  attr_accessible :datetime, :location

  belongs_to :study

  has_and_belongs_to_many :participants, join_table: "participants", class_name: "User"

  has_and_belongs_to_many :completees, join_table: "completions", class_name: "User"

  before_save :confirm_location

  def confirm_location
  	self.location = "UNKNOWN" if self.location.nil?
  end

  def notify
  	# Notify by email the users who are in the studies that are today or tomorrow
  	# This method runs in schedule.config using Whatever and uses a Mailer
  	# which is called ****(UNKNOWN). It runs every day at 0:00 (midnight). 
  	current = Time.now
  	Studytime.all.each do |st|
  		difference = st.datetime.to_time - current
  		if (0 < difference < 60*60*24)
  			# Then the study is in less than 24 hours
  			st.participants.each do |p|
  				#ReminderMailer.day_of_reminder(st, p).deliver
  			end 
  		# elsif (60*60*24 < difference < 60*60*48)
  		# 	# Then the study is not today, but tomorrow
  		# 	st.participants.each do |p|
  		# 		ReminderMailer.day_before_reminder(st, p).deliver
  		# 	end 
  		end
  	end
  end

  def toString
  	return self.datetime.strftime("%A %b %e, %l:%M %p") + " in " + self.location
  end
end