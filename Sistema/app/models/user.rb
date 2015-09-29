class User < ActiveRecord::Base
  #Validamos la presencia de todos los atributos
  validates :nombre, :direccion, :correo, presence: true
  validates :contraseña, presence: true,  on: :create
  #Verifica el formato del correo.
  validates :correo, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  #verifica la unicidad del correo en la tabla.
  validates :correo, uniqueness: true
  #Un sólo usuario puede tener asociado un cv
  has_one :cv
end
