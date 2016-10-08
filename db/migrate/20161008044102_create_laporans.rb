class CreateLaporans < ActiveRecord::Migration
  def change
    create_table :laporans do |t|
      t.integer :consumer_id
      t.float :latitude
      t.float :longitude
      t.integer :village_id
      t.boolean :to_consumer
      t.integer :process, default: 0
      t.boolean :verified

      t.timestamps null: false
    end
  end
end
