class HerosController < ApplicationController
  before_action :set_hero, only: %i[show edit update destroy]
  before_action :authenticate_user!, only: [:new, :create, :destroy, :update]

  def index
    @heros = Hero.all
  end

  def my_heros
    @my_heros = current_user.heros
  end

  def show
    @reservation = Reservation.new
  end

  def new
    @hero = Hero.new
    @hero.user = current_user
  end

  def create
    @hero = Hero.new(hero_params)
    @hero.user = current_user
    if @hero.save
      redirect_to my_heros_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @hero.update(hero_params)
    redirect_to hero_path(@hero)
  end

  def destroy
    @hero.destroy
    redirect_to my_heros_path, status: :see_other
  end

  private

  def set_hero
    @hero = Hero.find(params[:id])
  end

  def hero_params
    params.require(:hero).permit(:name, :role, :job, :guild, :description, :price)
  end
end
