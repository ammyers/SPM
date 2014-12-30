class RenameResearchersTable < ActiveRecord::Migration
	def change
		rename_table :researchers, :researcher_studies
	end
end
