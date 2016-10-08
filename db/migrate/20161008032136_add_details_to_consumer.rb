 	class AddDetailsToConsumer < ActiveRecord::Migration
  def change
    add_column :consumers, :fullname, :string
    add_column :consumers, :area_id, :integer
    add_column :consumers, :civil_role, :integer
    add_column :consumers, :username, :string, :unique => true
  end
end
