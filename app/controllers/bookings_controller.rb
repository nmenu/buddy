class BookingsController < ApplicationController
  before_action :set_offer, only: [:create]
  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.offer = @offer
    if @booking.save
      redirect_to booking_path(@booking)
    else
      flash[:alert] = @booking.errors.full_messages.join("\n")
      render "offers/show"
      # , status: :unprocessable_entity # message d'erreur
    end
  end

  private

  def set_offer
    @offer = Offer.find(params[:offer_id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
