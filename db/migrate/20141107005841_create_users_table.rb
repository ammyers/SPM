class CreateUsersTable < ActiveRecord::Migration
  def change
  	create_table :users do |p|
      p.string :first_name
      p.string :last_name
      p.string :email
      p.string :password
      p.string :role, :default => 'participant'
      p.timestamps
 	 end
  end
end
