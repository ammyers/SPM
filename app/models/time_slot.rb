class TimeSlot < ActiveRecord::Base
  attr_accessible :time

  belongs_to :study
end
