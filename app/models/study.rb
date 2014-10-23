class Study < ActiveRecord::Base
  attr_accessible :title, :description, :id, :researchers, :max_participants, :participants, :date_time, :special_instructions

end