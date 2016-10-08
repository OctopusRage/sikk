class AddDetailsToConsultant < ActiveRecord::Migration
  def change
    add_column :consultants, :fullname, :string
    add_column :consultants, :area_id, :integer
    add_column :consultants, :rank, :string
    add_column :consultants, :username, :string, :unique => true
  end
end
