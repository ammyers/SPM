# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

bobby = User.new(:first_name => 'Bobby', :last_name => 'Carpenter-Participant', :email => 'bcarpenter@ups.edu', :password => 'chuck', :role => 'participant')
sally = User.new(:first_name => 'Sally', :last_name => 'Winthrop-Researcher', :email => 'swinthrop@ups.edu', :password => 'wendy', :role => 'researcher')   	  
robin = User.new(:first_name => 'Robin', :last_name => 'Dorn-Admin', :email => 'rdorn@ups.edu', :password => 'password', :role => 'admin')

no_studies = User.new(:first_name => 'Damon', :last_name => 'Templeton', :email => 'da', :password => 'password', :role => 'participant')

bobby.save
sally.save
robin.save
no_studies.save

db_study = Study.new(:title => 'Test Study', :description => 'Can we make this database work? Can we access the data?', :max_participants => 40);
desert_study = Study.new(:title => 'Desert Study', :description => 'How many humps does a camel have?', :max_participants => 150);
ocean_study = Study.new(:title => 'Ocean Study', :description => 'Dolphins and things', :max_participants => 2);

db_study.save
desert_study.save
ocean_study.save

bobby.studies << desert_study
bobby.studies << ocean_study

sally.created_studies << desert_study
sally.studies << db_study