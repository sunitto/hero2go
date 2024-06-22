class ReservationsController < ApplicationController
  before_action :set_hero, only: %i[index new create]

  def index
    @heros = Hero.all
    @reservations = @hero.reservations
  end

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservations_params)
    @reservation.hero = @hero
    @reservation.user = current_user
    if @reservation.save
      raise
      redirect_to @reservation, notice: "We will process the hiring"
    else
      render :new
    end

    def show
      @reservation = Reservation.find(params[:id])
    end
  end

  private

  def set_hero
    @hero = Hero.find(params[:hero_id])
  end

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date)
  end
end
