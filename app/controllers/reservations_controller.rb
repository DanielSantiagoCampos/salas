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
    end_date = reservation_params[:start_date].to_datetime + reservation_params[:range].to_i.send(:hours)
    @reservation.end_date = end_date

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
    params.require(:reservation).permit(:start_date, :range, :user_id, :tool_id)
  end
end
