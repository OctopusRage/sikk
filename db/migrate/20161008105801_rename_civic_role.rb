class RenameCivicRole < ActiveRecord::Migration
  def change
  	rename_column :consumers, :civil_role, :civil_role_id
  end
end
