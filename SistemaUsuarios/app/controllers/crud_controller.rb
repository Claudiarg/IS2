class CrudController < ApplicationController
  def index
    #Con esta instrucción obtenemos todos los usuarios en la base de datos
    @user = User.all
  end

  def create
  end

  def read
  end

  def update
  end

  def delete
  end

  private
  def user_params
    
  end
end
