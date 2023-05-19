class DonationsController < ApplicationController
  protect_from_forgery except: :sample

  def index
    @donations = Donation.all
  end

  def show
    @donation = Donation.find(params[:id])
  end

  def edit
    @donation = Donation.find(params[:id])
  end

  def new
    @donation = Donation.new
  end

  def create
    donation_data = donation_params
    @donation = Donation.new(donation_data)

    if @donation.save
      redirect_to donations_path, success: 'Creado correctamente'
    else
      redirect_to new_donation_path, error: "No es posible crear: #{@donation.errors.full_messages.join(', ')}"
    end
  end

  def update
    donation = Donation.find(params[:id])

    if donation.update(donation_params)
      redirect_to donations_path, success: 'Actualizado correctamente'
    else
      redirect_to edit_donation_path(params[:id]), error: "No es posible actualizar: #{donation.errors.full_messages.join(', ')}"
    end
  end

  def destroy
    donation = Donation.find(params[:id])
    donation.destroy!
  end

  private

  def donation_params
    params.require(:donation).permit(:tool_name, :status, :user_id)
  end
end
