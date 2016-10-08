class CreateVillages < ActiveRecord::Migration
  def change
    create_table :villages do |t|
      t.integer :kd_prop
      t.integer :kd_kab
      t.integer :kd_kec
      t.integer :kd_desa
      t.string :propinsi
      t.string :kabupaten_kota
      t.string :kecamatan
      t.string :kelurahan_desa

      t.timestamps null: false
    end
  end
end
