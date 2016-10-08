class AddAdditionalInfoToLaporan < ActiveRecord::Migration
  def change
    add_column :laporans, :additional_info, :string
  end
end
