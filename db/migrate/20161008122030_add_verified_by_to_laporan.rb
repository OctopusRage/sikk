class AddVerifiedByToLaporan < ActiveRecord::Migration
  def change
    add_column :laporans, :verified_by, :integer
  end
end
