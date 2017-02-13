class TripsController < ApplicationController
  before_action :set_trip, only: [:show, :edit, :update, :destroy]
  def index
    @trips = current_user.trips
  end

  def show
  end

  def new
    @trip = current_user.trips.new 
  end

  def create
    @trip = current_user.trips.new(trip_params)
    if @trip.save
      flash[:success] = 'Trip Created!'
      redirect_to trip_path(@trip)
    else 
      render :new
    end
  end 

  def edit
  end 

  def update
    if @trip.update(trip_params)
      flash[:success] = 'Trip Updated!'
      redirect_to trip_path(@trip)
    else 
      render :edit
    end
  end

  def destroy
    @trip.destroy 
    flash[:success] = 'Trip Deleted!'
    redirect_to trips_path 
  end 

  private 
    def trip_params
      params.require(:trip).permit(:trip_name, :duration, :budget, :people_going)
    end
    def set_trip
      @trip = Trip.find(params[:id])
    end 
end
