class BookingsController < ApplicationController
  before_action :set_offer, only: [:create]

  def index
    @bookings = Booking.all
  end

  def price
    @total_price = ((booking_params.end_date.to_time - booking_params.start_date.to_time) / 1.hour * 1.0)
  end

  def show
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.offer = @offer
    if @booking.save
      redirect_to bookings_path(@bookings)
    else
      flash[:alert] = @booking.errors.full_messages.join("\n")
      render "offers/show"
      # , status: :unprocessable_entity # message d'erreur
    end
  end

  def update
    @booking.update(status_booking_params)
    redirect_to booking_path(@booking)
  end

  private

  def set_offer
    @offer = Offer.find(params[:offer_id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

  def status_booking_params
    params.require(:booking).permit(:status)
  end
end
