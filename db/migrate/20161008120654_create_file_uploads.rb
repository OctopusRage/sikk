class CreateFileUploads < ActiveRecord::Migration
  def change
    create_table :file_uploads do |t|
      t.string :url
      t.integer :uploader_id
      t.string :uploader_type
      t.string :hash_id

      t.timestamps null: false
    end
  end
end
