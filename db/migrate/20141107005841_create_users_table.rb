class CreateUsersTable < ActiveRecord::Migration
  def change
  	create_table :users do |p|
      p.string :first_name
      p.string :last_name
      p.string :email
      p.string :role
      p.boolean :setup, :default => false
      p.integer :credits, :default => 0
      p.timestamps
 	 end
  end
end
