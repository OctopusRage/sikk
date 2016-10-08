class ChangeTitleAndInfoIntoText < ActiveRecord::Migration
  def change
  	change_column :laporans, :title, :text
  	change_column :laporans, :additional_info, :text
  end
end
