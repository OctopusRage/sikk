class AddRawToFileUpload < ActiveRecord::Migration
  def change
    add_column :file_uploads, :raw, :json
  end
end
