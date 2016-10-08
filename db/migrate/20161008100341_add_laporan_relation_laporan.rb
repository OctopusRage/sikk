class AddLaporanRelationLaporan < ActiveRecord::Migration
  def change
  	add_column :laporans, :report_category_id, :integer
  end
end
