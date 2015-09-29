class CreateCvs < ActiveRecord::Migration
  def change
    create_table :cvs do |t|
      t.date :fecha_nacimiento
      t.string :rfc
      t.integer :area
      t.string :formacionUltimoGrado

      t.timestamps null: false
    end
  end
end
