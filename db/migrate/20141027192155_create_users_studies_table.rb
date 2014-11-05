class CreateUsersStudiesTable < ActiveRecord::Migration
  def up
    create_table :users_studies, :id => false do |t|
        t.belongs_to :user
        t.belongs_to :study
    end
    #add_index :users_studies, [:user_id, :study_id]
    #add_index :users_studies, :study_id
  end

  def down
    drop_table :users_studies
  end
end
