# This table connects participants with the studies (studytimes) that they have completed
class CreateCompletionsTable < ActiveRecord::Migration
  def up
  	create_table :completions, :id => false do |s|
  		s.references :user
  		s.references :studytime
  	end
  end

  def down
  end
end
