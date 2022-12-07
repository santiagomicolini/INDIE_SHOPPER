class ReservationsController < ApplicationController
  before_action :set_basket, only: [:create]

  def create
    @basket.products.each do |product|
      @reservation = Reservation.find_by(user: current_user, shop: product.shop)
      if @reservation.status == "Pending"
        authorize @reservation
        ReservationProduct.create(product: product, reservation: Reservation.find_by(user: current_user, shop: product.shop))
      else
        @reservation = Reservation.new(user: current_user, shop: product.shop)
        authorize @reservation
        @reservation.save
        ReservationProduct.create(product: product, reservation: @reservation)
      end
    end
    redirect_to reservations_path
  end

  def index
    @reservations = Reservation.where(user: current_user)
  end

  def edit
  end

  def update
    @reservation = Reservation.find(params[:id])
    authorize @reservation
    @reservation.update(status: params[:reservation][:status])
    # Respond to the AJAX request with the updated status
    respond_to do |format|
      format.json { render json: { status: @reservation.status } }
    end
  end

private

  def set_basket
    @basket = Basket.find(current_user.basket.id)
  end
end
