class UsersController < ApplicationController
  protect_from_forgery except: :sample

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    user_data = user_params
    @user = User.new(user_data)

    if @user.save
      redirect_to users_path, success: 'Creado correctamente'
    else
      redirect_to new_user_path, error: "No es posible crear: #{@user.errors.full_messages.join(', ')}"
    end
  end

  def update
    user = User.find(params[:id])

    if user.update(user_params)
      redirect_to users_path, success: 'Actualizado correctamente'
    else
      redirect_to new_user_path, error: "No es posible crear: #{user.errors.full_messages.join(', ')}"
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy!
  end

  private

  def user_params
    params.require(:user).permit(
      :first_names,
      :last_names,
      :email,
      :phone,
      :password,
      :role,
      :status
    )
  end
end
