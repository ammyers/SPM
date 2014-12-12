class ReminderMailer < ActionMailer::Base
  default from: "no_reply@pugetsound.edu"

  def day_of_reminder(user, studytime)
  	# For the reminders on the day of the study
  	@user = user
  	email_with_name = "#{@user.first_name @user.last_name} <#{@user.email}>"
  	@studytime = studytime
  	mail(to: email_with_name, subject: "Psychology Study Reminder [TODAY]")
  end

  def day_before_reminder(user, studytime)
  	# This is for those who need a reminder a full 48 hours before
  	@user = user
  	email_with_name = "#{@user.first_name @user.last_name} <#{@user.email}>"
  	@studytime = studytime
  	@study = studytime.study
  	mail(to: email_with_name, subject: "Psychology Study Reminder [TOMORROW]")
  end
end