class CreateReportCategories < ActiveRecord::Migration
  def change
    create_table :report_categories do |t|
      t.string :category

      t.timestamps null: false
    end
  end
end
