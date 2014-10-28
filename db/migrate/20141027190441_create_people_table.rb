class CreatePeopleTable < ActiveRecord::Migration
  def up
  	create_table :people do |p|
      p.string :first_name
      p.string :last_name
      p.string :email
      p.string :password
      p.string :role, :default => 'participant'

      p.timestamps
    end
  end

  def down
  	drop_table :people
  end
end
