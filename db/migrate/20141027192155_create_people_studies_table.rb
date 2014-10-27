class CreatePeopleStudiesTable < ActiveRecord::Migration
  def up
    create_table :people_studies, :id => false do |t|
        t.references :person
        t.references :study
    end
    add_index :people_studies, [:person_id, :study_id]
    add_index :people_studies, :study_id
  end

  def down
    drop_table :people_studies
  end
end
