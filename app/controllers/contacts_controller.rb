class ContactsController < ApplicationController
  def show
    @athlete = Athlete.find(params[:athlete_id])
    @contact = Contact.find(params[:id])
  end

  def new
    @athlete = Athlete.find(params[:athlete_id])
    @contact = Contact.new
  end

  def create
    @athlete = Athlete.find(params[:athlete_id])
    @contact = @athlete.contacts.build(contact_params)

    if @contact.save
      flash[:notice] = "A new contact was saved successfully."
      redirect_to [@contact]
    else
      flash.now[:alert] = "There was an error saving the new Contact. Please try again."
      render :new
    end
  end

  def edit
    @contact = Contact.find(params[:id])
  end

  def update
    @athlete = Athlete.find(params[:athlete_id])
    @contact = Contact.find(params[:id])
    @contact.assign_attributes(contact_params)

    if @contact.save
      flash[:notice] = "A new contact was saved successfully."
      redirect_to [@athlete]
    else
      flash.now[:alert] = "There was an error saving the new contact. Please try again."
      render :new
    end
  end

  def destroy
    @athlete = Athlete.find(params[:athlete_id])
    @contact = Contact.find(params[:id])
    if !@sport.startSportData?

      if @contact.destroy
        flash[:notice] = "\"#{@contact.email}\" was deleted successfully."
        redirect_to [@athlete]
      else
        flash.now[:alert] = "There was an error deleting the contact."
        render :show
      end
    end
  end


  private

    def contact_params
      params.require(:contact).permit(:phone, :email)
    end
end
