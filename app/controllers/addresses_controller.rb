class AddressesController < ApplicationController
  before_action :set_location
  before_action :set_address, only: [:show, :edit, :update, :destroy]

  def index 
    @address = @location.addresses.first
  end 

  def show
  end

  def new
    @address = @location.addresses.new
  end

  def create
    @address = @location.addresses.new(address_params)
    if @address.save
      flash[:success] = 'Address Created!'
      redirect_to location_addresses_path(@location)
    else 
      render :new
    end 
  end 

  def edit
  end

  def update 
    if @address.update(address_params)
      flash[:success] = 'Address Updated!'
      redirect_to location_addresses_path(@location)
    else 
      render :edit
    end
  end

  def destroy
    @address.destroy 
    flash[:success] = 'Address Deleted!'
    redirect_to location_addresses_path(@location)
  end 

  private 
  def address_params
    params.require(:address).permit(:physical_address, :country, :city, :description)
  end 

  def set_address
  
    @address = @location.addresses.find(params[:id])
  end 

  def set_location
    @location = Location.find(params[:location_id])
  end
end
