class AthletesController < ApplicationController

  def index
    @athletes = Athlete.where(user_id: current_user).order(active: :desc,lastName: :asc, firstName: :asc).all
  end

  def show
    @athlete = Athlete.find(params[:id])
  end

  def new
    @athlete = Athlete.new
    @contact = @athlete.build_contact #has-one association
    @academic = @athlete.build_academic
    @address = @athlete.build_address
    @current_address = @athlete.build_current_address
    @counselor_contact = @athlete.build_counselor_contact
    @father_address = @athlete.build_father_address
    @father_contact = @athlete.build_father_contact
    @mother_address = @athlete.build_mother_address
    @mother_contact = @athlete.build_mother_contact
    @school_address = @athlete.build_school_address
    @sibling = @athlete.build_sibling
  end

  def edit
    @athlete = Athlete.find(params[:id])
    @contact = @athlete.build_contact if @athlete.contact.nil? #has-one association
    @academic = @athlete.build_academic if @athlete.academic.nil?
    @address = @athlete.build_address if @athlete.address.nil?
    @current_address = @athlete.build_current_address if @athlete.current_address.nil?
    @counselor_contact = @athlete.build_counselor_contact if @athlete.counselor_contact.nil?
    @father_address = @athlete.build_father_address if @athlete.father_address.nil?
    @father_contact = @athlete.build_father_contact if @athlete.father_contact.nil?
    @mother_address = @athlete.build_mother_address if @athlete.mother_address.nil?
    @mother_contact = @athlete.build_mother_contact if @athlete.mother_contact.nil?
    @school_address = @athlete.build_school_address if @athlete.school_address.nil?
    @sibling = @athlete.build_sibling if @athlete.sibling.nil?
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
    p "in athlete update"

    if @athlete.save
      flash[:notice] = "Athlete was updated successfully."
      uncheck_all_schools_inactive_athlete
      #redirect_to @athlete
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

  def uncheck_all_schools_inactive_athlete
    # @sport = Sport.find(params[:id])
    # @divisionToChange = "All"
    p "in the uncheck_all_schools_inactive_athlete"
    # if @sport.active === false
    #   p "in the uncheck_all_schools_inactive with @sport.active === false"
    #   uncheck_all
    # end
    redirect_to [@athlete]
  end


  private

  def athlete_params
    params.require(:athlete).permit(:firstName, :middleName, :lastName, :preferredName, :yearStartingSchool, :active,
      :academic_attributes=> [:schoolName, :phone, :satMath, :satEnglish, :satTotal, :actTotal,  :tofelTotal, :gpa, :gpaScale, :classRank, :classSize, :notes],
      :address_attributes=> [:street, :street2, :city, :state, :zip, :country],
      :contact_attributes=> [:phone, :email],
      :current_address_attributes=> [:street, :street2, :city, :state, :zip, :country],
      :counselor_contact_attributes=> [:firstName, :lastName, :phone, :email],
      :father_address_attributes=> [:street, :street2, :city, :state, :zip, :country],
      :father_contact_attributes=> [:firstName, :lastName, :phone, :email],
      :mother_address_attributes=> [:street, :street2, :city, :state, :zip, :country],
      :mother_contact_attributes=> [:firstName, :lastName, :phone, :email],
      :school_address_attributes=> [:street, :street2, :city, :state, :zip, :country],
      :sibling_attributes=> [:siblingNames]
    )
  end

end
