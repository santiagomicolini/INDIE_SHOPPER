class ReservationsController < ApplicationController
  before_action :set_basket, only: [:create]
  require "rqrcode"
  include RQRCode

  def create
    @basket.products.each do |product|
      @reservation = Reservation.find_by(user: current_user, shop: product.shop)
      if @reservation && @reservation.status == "Pending"
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
    @user = @reservation.user
    @reservation.update(status: params[:reservation][:status])
    generate_qr_code(@reservation) if params[:reservation][:status] == "Confirmed"
    UserMailer.with(user: @user, reservation: @reservation).status_update.deliver_now
    # respond_to do |format|
    #   format.json { render json: { status: @reservation.status } }
    # end
    redirect_to my_shop_path
  end

  def qr_collected
    @reservation = Reservation.find(params[:q])
    authorize @reservation
    if @reservation.shop.user == current_user
      @reservation.update(status: "Collected")
      redirect_to my_shop_path
    else
      redirect_to root_path
    end
  end

  def generate_qr_code(reservation)
    qr = RQRCode::QRCode.new("localhost:3000/qr-collected/?q=#{reservation.id}")

    png = qr.as_png(
      bit_depth: 1,
      border_modules: 4,
      color_mode: ChunkyPNG::COLOR_GRAYSCALE,
      color: 'black',
      fill: 'white',
      module_px_size: 6,
      resize_exactly_to: false,
      resize_gte_to: false,
      size: 120)
      File.binwrite("tmp/qr_code.png", png.to_s)
  end

    private

  def set_basket
    @basket = Basket.find(current_user.basket.id)
  end
end
