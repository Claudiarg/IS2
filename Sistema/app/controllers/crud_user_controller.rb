class CrudUserController < ApplicationController
  def index
    @users = User.all
  end

  def create
    #Lo que estaba fallando en el lab es que no estabamos mandando un campo
    #"Contraseña" el cual esta como requerido en el modelo.
    @user = User.new user_params
    if request.post?
      if @user.valid?
        @user.save!
        redirect_to crud_user_index_path
      end
   end
  end

  def delete
    #Checamos que se haya hecho una petición post y que el arreglo de los id's
    #que mandamos para eliminar no sea vacío.
    if request.post? && delete_users[:users].blank? == false
      @user = delete_users[:users]
      @user.each do |u|
         User.find(u).destroy
      end
      redirect_to crud_user_index_path
    else
      redirect_to crud_user_index_path
    end
  end

  def update
    #Buscamos el usuario conforme al id que obtengamos en el link asignado a la vista
    #Con esto llenamos la vista de editar con los datos obtenidos de la base de datos.
    @user = User.find (edit_user[:id])
    if request.post?
      @user.nombre = user_params[:nombre]
      @user.direccion = user_params[:direccion]
      @user.correo = user_params[:correo]
      if @user.valid?
        @user.save
        redirect_to crud_user_index_path
      end
    end

  end

  def read
  end

  private
  def user_params
    params.require(:user).permit(:nombre, :direccion, :correo, :contraseña) if params[:user]
  end
  #Con esto recibimos el id del usuario que deseamos editar.
  def edit_user
    params.permit(:id)
  end
  def delete_users
    params.permit(:users => [])
  end

end
