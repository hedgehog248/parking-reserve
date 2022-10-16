class CertificatesController < ApplicationController
  before_action :set_reserv, only: [:index, :new, :create]

  # PDFの表示をindexアクションに記述
  def index
    generate_certificate = GenerateCertificate.new(@reservation).render
    send_data generate_certificate,
      filename:    'parking_tickets.pdf',
      type:        'application/pdf',
      disposition: 'inline'
  end

  def new
    @certificate = Certificate.new
  end

  def create
    @certificate = Certificate.new(certificate_params)
    if @certificate.valid?
      @certificate.save
      redirect_to root_path and return
    else
      render :new
    end
  end

  private

  def set_reserv
    @reservation = Reservation.find(params[:reservation_id])
  end

  def certificate_params
    params.require(:certificate).permit(
      :building_num, :room_num, :destination, :car_model, :license_num, :drivers_name
      ).merge(reservation_id: params[:reservation_id]
    )
  end
end