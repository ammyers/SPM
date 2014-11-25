class AddPaperOption < ActiveRecord::Migration
  def change
  	add_column :users, :paper_option, :boolean, :defalut => false
  end
end
