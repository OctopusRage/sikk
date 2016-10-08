class CreateCivilRoles < ActiveRecord::Migration
  def change
    create_table :civil_roles do |t|
      t.string :role_name
      t.string :desc

      t.timestamps null: false
    end
  end
end
