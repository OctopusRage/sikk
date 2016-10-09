class RenameColumnInConsumerNConsultant < ActiveRecord::Migration
  def change
  	rename_column :consumers, :area_id, :village_id
  	rename_column :consultants, :area_id, :village_id
  end
end
