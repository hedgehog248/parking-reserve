class CertificatesController < ApplicationController
  before_action :set_reserv, only: [:new, :create]
  def index
  end

  def new
    @certificate = Certificate.new
  end

  def create
    certificate = certificate_params
    respond_to do |format|
      format.pdf do
        create_certificate = CreateCertificate.new(@reservation, certificate).render
        send_data create_certificate,
          filename:    'parking_tickets.pdf',
          type:        'application/pdf',
          disposition: 'inline'
      end
    end
  end

  private

  def set_reserv
    @reservation = Reservation.find(params[:reservation_id])
  end

  def certificate_params
    params.require.permit(:destination, :car_model, :license_num)
  end
end