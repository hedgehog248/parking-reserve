class CertificatesController < ApplicationController
  before_action :set_reserv
  
  # PDFの表示をshowアクションに記述
  def show
    generate_certificate = GenerateCertificate.new(@reservation).render
    send_data generate_certificate,
              filename: 'parking_tickets.pdf',
              type: 'application/pdf',
              disposition: 'inline'
  end

  def new
    @certificate = Certificate.new
    set_carlist
  end

  def create
    @certificate = Certificate.new(certificate_params)
    if @certificate.save
      redirect_to root_path
    else
      set_carlist
      render :new
    end
  end

  def edit
    @certificate = @reservation.certificate
    set_carlist
  end

  def update
    @certificate = Certificate.find(params[:id])
    if @certificate.update(certificate_params)
      redirect_to root_path
    else
      set_carlist
      render :edit
    end
  end

  private

  def set_reserv
    @reservation = Reservation.find(params[:reservation_id])
  end

  def certificate_params
    params.require(:certificate).permit(
      :building_num, :room_num, :destination, :car_model, :license_num, :drivers_name
    ).merge(reservation_id: params[:reservation_id])
  end

  def set_carlist
    @cars = Car.where(user_id: current_user.id)
    gon.cars = @cars
    gon.user = current_user
  end
end
