class TicketsController < ApplicationController
  before_action :set_reserv, only: [:new, :create]
  def index
  end

  def new
    @ticket = Ticket.new
  end

  def create
    ticket = params.require(:ticket).permit(:destination, :car_model, :license_num)
    respond_to do |format|
      format.pdf do
        create_ticket = CreateTicket.new(@reservation, ticket).render
        send_data create_ticket,
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

  def ticket_params
    params.permit(:destination, :car_model, :license_num)
  end
end
