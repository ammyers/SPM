class AddPaperOption < ActiveRecord::Migration
  def change
  	add_column :users, :paper_option, :boolean, :default => false
  end
end
