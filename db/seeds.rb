# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

bobby = User.create(:first_name => 'Bobby', :last_name => 'Carpenter', :email => 'bcarpenter@pugetsound.edu', :role => 'participant')
sally = User.create(:first_name => 'Sally', :last_name => 'Winthrop', :email => 'swinthrop@pugetsound.edu', :role => 'researcher')   	  
hailey = User.create(:first_name => 'Hailey', :last_name => 'Ember', :email => 'd@pugetsound.edu', :role => 'participant')   	  
holly = User.create(:first_name => 'Holly', :last_name => 'Zender', :email => 'swin@pugetsound.edu', :role => 'participant')   	  
tommy = User.create(:first_name => 'Tommy', :last_name => 'Van Der Waal', :email => 'swinths@pugetsound.edu', :role => 'participant')   	  
bill = User.create(:first_name => 'Bill', :last_name => 'McKibben', :email => 'swins@pugetsound.edu', :role => 'participant', :member_of => 'student')   	  
joel = User.create(:first_name => 'Joe', :last_name => 'Rous', :email => 'jross@pugetsound.edu', :role => 'researcher', :member_of => 'student')
robin = User.create(:first_name => 'Robin', :last_name => 'Dorn', :email => 'rdorn@pugetsound.edu', :role => 'admin', :member_of => 'faculty')

db_study = Study.create(:title => 'Test Study', :description => 'Can we make this database work? Can we access the data?', :max_participants => 40, :duration => " up to 30 mins");
desert_study = Study.create(:title => 'Desert Study', :description => 'How many humps does a camel have?', :max_participants => 150, :duration => "up to 60 mins");
ocean_study = Study.create(:title => 'Ocean Study', :description => 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.', :max_participants => 2, :duration => "Time in Description");
sky_study = Study.create(:title => 'The Effects of The Sky', :description => 'Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.', :max_participants => 20, :duration => "up to 30 mins");
moon_study = Study.create(:title => 'Three Moons and Four Gorges', :description => ' Lorem Ipsum is not simply random text.', :max_participants => 15, :duration => "up to 60 mins");

sally.created_studies << desert_study
joel.created_studies << db_study
sally.created_studies << ocean_study
joel.created_studies << sky_study

course_section1 = Course.create(:section => '101A', :instructor => 'Weisz')
course_section2 = Course.create(:section => '101C', :instructor => 'Ross')
course_section3 = Course.create(:section => '201A', :instructor => 'Richards')

sally.courses << course_section1
joel.courses << course_section2
sally.courses << course_section3
bobby.courses << course_section1
holly.courses << course_section1
hailey.courses << course_section1
bill.courses << course_section3

db_time1 = Studytime.create(:datetime => Time.parse('14 Dec 2014 18:50:00 -0800'), :location => "Wey 310")
desert_time1 = Studytime.create(:datetime => Time.parse('9 Nov 2014 17:30:00 -0800'), :location => "Wey 246")
desert_time2 = Studytime.create(:datetime => Time.parse('9 Nov 2014 15:30:00 -0800'), :location => "Wey 340")
desert_time3 = Studytime.create(:datetime => Time.parse('9 Jan 2014 08:30:00 -0800'), :location => "Wey 114")
desert_time4 = Studytime.create(:datetime => Time.parse('23 Feb 2015 12:30:00 -0800'), :location => "Wey 114")
ocean_time1 = Studytime.create(:datetime => Time.parse('14 Dec 2014 14:30:00 -0800'), :location => "Wey 298")
ocean_time2 = Studytime.create(:datetime => Time.parse('1 Jan 2015 10:30:00 -0800'), :location => "Wey 114")
sky_time1 = Studytime.create(:datetime => Time.parse('1 Jan 2014 10:30:00 -0800'), :location => "Wey 114")
moon_time1 = Studytime.create(:datetime => Time.parse('1 Jan 2015 10:30:00 -0800'), :location => "Wey 114")

db_study.studytimes << db_time1
desert_study.studytimes << desert_time1
desert_study.studytimes << desert_time2
desert_study.studytimes << desert_time3
desert_study.studytimes << desert_time4
ocean_study.studytimes << ocean_time1
ocean_study.studytimes << ocean_time2
sky_study.studytimes << sky_time1
moon_study.studytimes << moon_time1

bobby.studytimes << db_time1
bobby.studytimes << desert_time2
bobby.completedstudies << db_time1
sally.studytimes << desert_time1
sally.studytimes << ocean_time1
hailey.studytimes << sky_time1
hailey.studytimes << moon_time1
bill.studytimes << desert_time4
tommy.studytimes << moon_time1
tommy.studytimes << desert_time1
tommy.studytimes << ocean_time1
tommy.completedstudies << ocean_time1