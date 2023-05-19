class ReservationsController < ApplicationController
  protect_from_forgery except: :sample

  def index
    @reservations = Reservation.all
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def edit
    @reservation = Reservation.find(params[:id])
  end

  def new
    @reservation = Reservation.new
  end

  def create
    reservation_data = reservation_params
    @reservation = Reservation.new(reservation_data)
    reserved_until = reservation_params[:reserved_at].to_datetime + reservation_params[:range].to_i.send(:hours)
    @reservation.reserved_until = reserved_until

    if @reservation.save
      redirect_to reservations_path, success: 'Creado correctamente'
    else
      redirect_to new_reservation_path, error: "No es posible crear: #{@reservation.errors.full_messages.join(', ')}"
    end
  end

  def update
    reservation = Reservation.find(params[:id])

    if reservation.update(reservation_params)
      redirect_to reservations_path, success: 'Actualizado correctamente'
    else
      redirect_to edit_reservation_path(params[:id]), error: "No es posible actualizar: #{reservation.errors.full_messages.join(', ')}"
    end
  end

  def destroy
    reservation = Reservation.find(params[:id])
    reservation.destroy!
  end

  private

  def reservation_params
    params.require(:reservation).permit(:reserved_at, :range, :user_id, :tool_id)
  end
end
