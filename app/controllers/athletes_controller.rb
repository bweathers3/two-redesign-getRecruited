class AthletesController < ApplicationController

  def index
    @athletes = Athlete.where(user_id: current_user).order(active: :desc,lastName: :asc, firstName: :asc).all
  end

  def show
    @athlete = Athlete.find(params[:id])
  end

  def new
    @athlete = Athlete.new
    @athlete.contact.build
    @athlete.address.build
    @athlete.current_address.build
    @athlete.father_address.build
    @athlete.father_contact.build
    @athlete.mother_address.build
    @athlete.mother_contact.build
    @athlete.school_address.build
    @athlete.sibling.build
  end


  def edit
    @athlete = Athlete.find(params[:id])
    @athlete.contact.build if @athlete.contact.nil?
    @athlete.address.build if @athlete.address.nil?
    @athlete.current_address.build  if @athlete.current_address.nil?
    @athlete.father_address.build  if @athlete.father_address.nil?
    @athlete.father_contact.build  if @athlete.father_contact.nil?
    @athlete.mother_address.build  if @athlete.mother_address.nil?
    @athlete.mother_contact.build  if @athlete.mother_contact.nil?
    @athlete.school_address.build  if @athlete.school_address.nil?
    @athlete.sibling.build  if @athlete.sibling.nil?
  end

  def create
    @athlete = Athlete.new(athlete_params)
    @athlete.user = current_user

    if @athlete.save
      flash[:notice] = "Athlete was saved successfully."
      redirect_to @athlete
    else
      flash.now[:alert] = "There was an error saving the athlete. Please try again."
      render :new
    end
  end

  def update
    @athlete = Athlete.find(params[:id])
    @athlete.assign_attributes(athlete_params)

    if @athlete.save
      flash[:notice] = "Athlete was updated successfully."
      redirect_to @athlete
    else
      flash.now[:alert] = "There was an error saving the athlete. Please try again."
      render :new
    end
  end

  def destroy
    @athlete = Athlete.find(params[:id])
    if @athlete.destroy
      flash[:notice] = "\"#{@athlete.lastName}\" was deleted successfully."
      redirect_to athletes_path
    else
      flash.now[:alert] = "There was an error deleting the post."
      render :show
    end
  end


  private

  def athlete_params
    params.require(:athlete).permit(:firstName, :middleName, :lastName, :preferredName, :yearStartingSchool, :active,
      :contact_attributes=> [:phone, :email],
      :address_attributes=> [:street, :street2, :city, :state, :zip, :country],
      :current_address_attributes=> [:street, :street2, :city, :state, :zip, :country],
      :father_address_attributes=> [:street, :street2, :city, :state, :zip, :country],
      :father_contact_attributes=> [:firstName, :middleName, :phone, :email],
      :mother_address_attributes=> [:street, :street2, :city, :state, :zip, :country],
      :mother_contact_attributes=> [:firstName, :middleName, :phone, :email],
      :school_address_attributes=> [:street, :street2, :city, :state, :zip, :country],
      :sibling_attributes=> [:siblingNames]
    )
  end

end
