class PlacesController < ApplicationController
  before_action :require_login

  def index
    @places = Place.all
  end

  def show
    @place = Place.find(params[:id])
    # Only show entries belonging to the logged-in user
    @entries = @place.entries.where(user: current_user)
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(place_params)
    if @place.save
      redirect_to places_path, notice: "Place created successfully."
    else
      render :new
    end
  end

  private

  def place_params
    params.require(:place).permit(:name)
  end
end
