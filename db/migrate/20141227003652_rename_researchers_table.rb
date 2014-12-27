class RenameResearchersTable < ActiveRecord::Migration
	def change
		rename_table :researchers, :assigned_studies
	end
end
