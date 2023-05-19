class LoginsController < ApplicationController
  protect_from_forgery except: :sample

  def show
    if params[:destroy_session]
      redirect_to login_path, success: 'Ingrese para continuar!'
      session[:user_id] = nil
    end
  end

  def create
    email = user_params[:email]
    password = user_params[:password]

    @user = User.find_by(email: email, password: password)

    if @user.present?
      session[:user_id] = @user.id
      redirect_to homes_path, success: 'Logeado correctamente!'
    else
      redirect_to root_path, error: "Correo o contraseña invalidos!"
    end
  end

  private

  def user_params
    params.permit(
      :email,
      :password,
    )
  end
end
