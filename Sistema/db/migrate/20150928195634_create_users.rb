class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :nombre
      t.string :direccion
      t.string :correo
      t.string :contraseña
      t.integer :edad

      t.timestamps null: false
    end
  end
end
