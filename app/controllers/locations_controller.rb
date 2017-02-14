class LocationsController < ApplicationController
  before_action :set_trip
  before_action :set_location, only: [:show, :edit, :update, :destroy]
  
  def index
    @locations = @trip.locations 
  end 
  
  def show
  end

  def new
    @location = @trip.locations.new 
  end

  def create
    @location = @trip.locations.new(location_params)
    if @location.save
      flash[:success] = 'Location Created!'
     redirect_to trip_location_path(@trip, @location)
    else
      render :new 
    end 
  end 

  def edit
  end

  def update
    if @location.update(location_params)
      flash[:success] = 'Location Updated!'
      redirect_to trip_location_path(@trip, @location)
    else 
      render :edit 
    end 
  end

  def destroy
    @location.destroy
    flash[:succes] = 'Location Deleted!'
    redirect_to trip_locations_path(@trip)
  end

  private 

  def location_params
    params.require(:location).permit(:name, :description)
  end 

  def set_trip
    @trip = Trip.find(params[:trip_id])
  end  

  def set_location
    @location = @trip.locations.find(params[:id])
  end 
end
