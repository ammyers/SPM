class AddPaperOption < ActiveRecord::Migration
  def up
  	add_column :users, :paper_option, :bool, :defalut => false
  end

  def down
  end
end
