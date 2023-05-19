class CalendarsController < ApplicationController
  def show
    puts "#" * 100
    puts params
    start_date = params.fetch(:start_date, Date.today).to_date
    @reservations = Reservation.where(start_date: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)
    puts @reservations.count
  end
end
