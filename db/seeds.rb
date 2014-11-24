# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

bobby = User.create(:first_name => 'Bobby', :last_name => 'Carpenter', :email => 'bcarpenter@ups.edu', :password => 'chuck', :role => 'participant', :paper_option => false)
sally = User.create(:first_name => 'Sally', :last_name => 'Winthrop', :email => 'swinthrop@ups.edu', :password => 'wendy', :role => 'researcher', :paper_option => false)	  
joel = User.create(:first_name => 'Joel', :last_name => 'Ross', :email => 'jross@ups.edu', :password => 'hello', :role => 'researcher', :paper_option => false)
robin = User.create(:first_name => 'Robin', :last_name => 'Dorn', :email => 'rdorn@ups.edu', :password => 'password', :role => 'admin', :paper_option => false)
no_studies = User.create(:first_name => 'Damon', :last_name => 'Templeton', :email => 'da', :password => 'password', :role => 'participant', :paper_option => false)

db_study = Study.create(:title => 'Test Study', :description => 'Can we make this database work? Can we access the data?', :max_participants => 40, :duration => "30 min");
desert_study = Study.create(:title => 'Desert Study', :description => 'How many humps does a camel have?', :max_participants => 150, :duration => "45 min");
ocean_study = Study.create(:title => 'Ocean Study', :description => 'Dolphins and things', :max_participants => 2, :duration => "50 min");

sally.created_studies << desert_study
joel.created_studies << db_study
sally.created_studies << ocean_study
joel.created_studies << ocean_study

db_time1 = Studytime.create(:datetime => DateTime.parse('9 Nov 2014 18:30:00'))
desert_time1 = Studytime.create(:datetime => DateTime.parse('9 Nov 2014 17:30:00'))
desert_time2 = Studytime.create(:datetime => DateTime.parse('9 Nov 2014 15:30:00'))
ocean_time1 = Studytime.create(:datetime => DateTime.parse('9 Nov 2014 15:30:00'))

db_study.studytimes << db_time1
desert_study.studytimes << desert_time1
desert_study.studytimes << desert_time2
ocean_study.studytimes << ocean_time1

bobby.studytimes << db_time1
bobby.studytimes << desert_time2

sally.studytimes << desert_time1
sally.studytimes << ocean_time1