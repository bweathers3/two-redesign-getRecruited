class AddressesController < ApplicationController
  def show
    @athlete = Athlete.find(params[:athlete_id])
    @address = Address.find(params[:id])
  end

  def new
    @athlete = Athlete.find(params[:athlete_id])
    @address = Address.new
  end

  def create
    @athlete = Athlete.find(params[:athlete_id])
    @address = @athlete.addresses.build(address_params)

    if @address.save
      flash[:notice] = "A new address was saved successfully."
      redirect_to [@address]
    else
      flash.now[:alert] = "There was an error saving the new address. Please try again."
      render :new
    end
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    @athlete = Athlete.find(params[:athlete_id])
    @address = Address.find(params[:id])
    @address.assign_attributes(address_params)

    if @address.save
      flash[:notice] = "A new address was saved successfully."
      redirect_to [@athlete]
    else
      flash.now[:alert] = "There was an error saving the new address. Please try again."
      render :new
    end
  end

  def destroy
    @athlete = Athlete.find(params[:athlete_id])
    @address = Address.find(params[:id])
    if !@sport.startSportData?

      if @contact.destroy
        flash[:notice] = "\"#{@address.street}\" was deleted successfully."
        redirect_to [@athlete]
      else
        flash.now[:alert] = "There was an error deleting the address."
        render :show
      end
    end
  end


  private

    def address_params
      params.require(:address).permit(:street, :street2, :city, :state, :zip, :country)
    end
end
