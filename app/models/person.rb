class Person < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :id, :email, :password, :studies, :created_studies

end