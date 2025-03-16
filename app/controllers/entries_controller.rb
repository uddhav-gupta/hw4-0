class EntriesController < ApplicationController
  before_action :require_login

  def new
    @place = Place.find(params[:place_id])
    @entry = @place.entries.build
  end

  def create
    @place = Place.find(params[:place_id])
    @entry = @place.entries.build(entry_params)
    @entry.user = current_user

    if @entry.save
      # Optional: Attach an image if provided
      if params[:entry][:image]
        @entry.image.attach(params[:entry][:image])
      end
      redirect_to place_path(@place), notice: "Entry created successfully."
    else
      render :new
    end
  end

  private

  def entry_params
    params.require(:entry).permit(:title, :description, :occurred_on)
  end
end
