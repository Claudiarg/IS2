class CrudController < ApplicationController
  def index
    #Con esta instrucción obtenemos todos los usuarios en la base de datos
    @userAll = User.all
  end

  def create
    @user = User.new user_params #Asignamos los valores del formulario a una instancia nueva.
    if request.post? #Si se recibe una petición POST
          if @user.valid? # .valid es un método definido para los objetos que ayuda a verificar si cumple con las validaciones definidas en el modelo.
             @user.save #Guardamos si es válido
             flash[:crud_create] = "Local creado de forma exitosa."
             redirect_to crud_index_path
          end
    end
  end

  def read
  end

  def update
  end

  def delete
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :address, :phone,:age) if params[:user]
  end
  def delete_cashiers
    params.permit(:users => [])
  end
end
