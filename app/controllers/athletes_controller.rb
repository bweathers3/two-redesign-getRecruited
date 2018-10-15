class AthletesController < ApplicationController
  def index
    @athletes = Athlete.where(user_id: current_user).order(active: :desc,lastName: :asc, firstName: :asc).all
  end

  def show
    @athlete = Athlete.find(params[:id])
  end

  def new
    @athlete = Athlete.new
  end

  def create
    @athlete = Athlete.new
    @athlete.firstName = params[:athlete][:firstName]
    @athlete.middleName = params[:athlete][:middleName]
    @athlete.lastName = params[:athlete][:lastName]
    @athlete.preferredName = params[:athlete][:preferredName]
    @athlete.yearStartingSchool = params[:athlete][:yearStartingSchool]
    @athlete.active = params[:athlete][:active]
    @athlete.user = current_user

    if @athlete.save
      flash[:notice] = "Athlete was saved successfully."
      redirect_to @athlete
    else
      flash.now[:alert] = "There was an error saving the athlete. Please try again."
      render :new
    end
  end

  def edit
    @athlete = Athlete.find(params[:id])
  end

  def update
    @athlete = Athlete.find(params[:id])
    @athlete.firstName = params[:athlete][:firstName]
    @athlete.middleName = params[:athlete][:middleName]
    @athlete.lastName = params[:athlete][:lastName]
    @athlete.preferredName = params[:athlete][:preferredName]
    @athlete.yearStartingSchool = params[:athlete][:yearStartingSchool]
    @athlete.active = params[:athlete][:active]

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

end
