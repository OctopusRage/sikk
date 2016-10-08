class AddTitleToLaporan < ActiveRecord::Migration
  def change
    add_column :laporans, :title, :string
  end
end
