# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever

# Every day send out notifications for the next day's studies
every '0 0 * * * *' do
	runner "Studytime.notify"
end

# Every Jan 1st
every '0 0 1 1 * *' do
	rake "db:reset"
end

# Every Jun 1st
every '0 0 1 6 * *' do
	rake "db:reset"
end