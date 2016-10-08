class AddUserContentToLaporan < ActiveRecord::Migration
  def change
    add_column :laporans, :content, :string
  end
end
