class Admin < ActiveRecord::Base
  #verificamos la presencia de los campos al querer crear o actualizar los datos.
  validates :name, :email, presence: true
  #Validamos la presencia de el atributo password al crear un nuevo registro.
  validates :password, presence: true, on: :create
  # Validamos la unicidad de los correos de cada usuario pidiendo que no se repitan en los regitros.
  validates :email, uniqueness: true
  #Definimos una expresión regular para definir la estructura de un correo válido.
  #Esto lo checamos al crear o actualizar un nuevo registro.
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}
end
