class CurrentAddressesController < ApplicationController
  def show
    @athlete = Athlete.find(params[:athlete_id])
    @current_address = CurrentAddress.find(params[:id])
  end

  def new
    @athlete = Athlete.find(params[:athlete_id])
    @current_address = CurrentAddress.new
  end

  def create
    @athlete = Athlete.find(params[:athlete_id])
    @current_address = @athlete.current_addresses.build(current_address_params)

    if @current_address.save
      flash[:notice] = "A new current_address was saved successfully."
      redirect_to [@athlete]
    else
      flash.now[:alert] = "There was an error saving the new current_address. Please try again."
      render :new
    end
  end

  def edit
    @current_address = CurrentAddress.find(params[:id])
  end

  def update
    @athlete = Athlete.find(params[:athlete_id])
    @current_address = CurrentAddress.find(params[:id])
    @current_address.assign_attributes(current_address_params)

    if @current_address.save
      flash[:notice] = "A new current_address was saved successfully."
      redirect_to [@athlete]
    else
      flash.now[:alert] = "There was an error saving the new current_address. Please try again."
      render :new
    end
  end

  def destroy
    @athlete = Athlete.find(params[:athlete_id])
    @current_address = CurrentAddress.find(params[:id])
    if !@sport.startSportData?

      if @current_address.destroy
        flash[:notice] = "\"#{@current_address.street}\" was deleted successfully."
        redirect_to [@athlete]
      else
        flash.now[:alert] = "There was an error deleting the current_address."
        render :show
      end
    end
  end


  private

    def current_address_params
      params.require(:current_address).permit(:street, :street2, :city, :state, :zip, :country)
    end
end
