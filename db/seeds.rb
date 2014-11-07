# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

bobby = User.new(:first_name => 'Bobby', :last_name => 'Carpenter-Participant', :email => 'bcarpenter@ups.edu', :password => 'chuck', :role => 'participant')

sally = User.new(:first_name => 'Sally', :last_name => 'Winthrop-Researcher', :email => 'swinthrop@ups.edu', :password => 'wendy', :role => 'researcher')
    	  
robin = User.new(:first_name => 'Robin', :last_name => 'Dorn-Admin', :email => 'rdorn@ups.edu', :password => 'password', :role => 'admin')

robin.save
sally.save
bobby.save

study = Study.new(:title => 'Test Study', :description => 'Can we make this database work? Can we access the data?', :max_participants => 40, :length '30 min', :times '2014,11,21,18,0,0','2014,');

study.save