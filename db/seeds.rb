# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

bobby = User.create(:first_name => 'Bobby', :last_name => 'Carpenter', :email => 'bcarpenter@ups.edu', :password => 'chuck', :role => 'participant')
sally = User.create(:first_name => 'Sally', :last_name => 'Winthrop', :email => 'swinthrop@ups.edu', :password => 'wendy', :role => 'researcher')   	  
joel = User.create(:first_name => 'Joel', :last_name => 'Ross', :email => 'jross@ups.edu', :password => 'hello', :role => 'researcher')
robin = User.create(:first_name => 'Robin', :last_name => 'Dorn', :email => 'rdorn@ups.edu', :password => 'password', :role => 'admin')
no_studies = User.create(:first_name => 'Damon', :last_name => 'Templeton', :email => 'da', :password => 'password', :role => 'participant')

db_study = Study.create(:title => 'Test Study', :description => 'Can we make this database work? Can we access the data?', :max_participants => 40, :duration => "30 min");
desert_study = Study.create(:title => 'Desert Study', :description => 'How many humps does a camel have?', :max_participants => 150, :duration => "45 min");
ocean_study = Study.create(:title => 'Ocean Study', :description => 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32. The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.', :max_participants => 2, :duration => "50 min");

sally.created_studies << desert_study
joel.created_studies << db_study
sally.created_studies << ocean_study
joel.created_studies << ocean_study

db_time1 = Studytime.create(:datetime => DateTime.parse('9 Nov 2014 18:30:00'), :location => "Wey 310")
desert_time1 = Studytime.create(:datetime => DateTime.parse('9 Nov 2014 17:30:00'), :location => "Wey 246")
desert_time2 = Studytime.create(:datetime => DateTime.parse('9 Nov 2014 15:30:00'), :location => "Wey 340")
desert_time3 = Studytime.create(:datetime => DateTime.parse('9 Jan 2014 08:30:00'), :location => "Wey 114")
desert_time4 = Studytime.create(:datetime => DateTime.parse('23 Feb 2014 12:30:00'), :location => "Wey 114")
ocean_time1 = Studytime.create(:datetime => DateTime.parse('14 Dec 2014 14:30:00'), :location => "Wey 298")
ocean_time2 = Studytime.create(:datetime => DateTime.parse('1 Jan 2014 10:30:00'), :location => "Wey 114")

db_study.studytimes << db_time1
desert_study.studytimes << desert_time1
desert_study.studytimes << desert_time2
desert_study.studytimes << desert_time3
desert_study.studytimes << desert_time4
ocean_study.studytimes << ocean_time1
ocean_study.studytimes << ocean_time2

bobby.studytimes << db_time1
bobby.studytimes << desert_time2
bobby.completedstudies << db_time1

sally.studytimes << desert_time1
sally.studytimes << ocean_time1