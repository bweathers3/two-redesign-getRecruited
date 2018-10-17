class SportsController < ApplicationController

  def show
    @athlete = Athlete.find(params[:athlete_id])
    @sport = Sport.find(params[:id])
  end

  def new
    @athlete = Athlete.find(params[:athlete_id])
    @sport = Sport.new
  end

  def create
    @athlete = Athlete.find(params[:athlete_id])
    @sport = @athlete.sports.build(sport_params)

    if @sport.save
      flash[:notice] = "A new sport was saved successfully."
      redirect_to [@athlete]
    else
      flash.now[:alert] = "There was an error saving the new sport. Please try again."
      render :new
    end
  end

  def edit
    @sport = Sport.find(params[:id])
  end

  def update
    @athlete = Athlete.find(params[:athlete_id])
    @sport = Sport.find(params[:id])
    @sport.assign_attributes(sport_params)

    if @sport.save
      flash[:notice] = "A new sport was saved successfully."
      redirect_to [@athlete]
    else
      flash.now[:alert] = "There was an error saving the new sport. Please try again."
      render :new
    end
  end

  def destroy
    @athlete = Athlete.find(params[:athlete_id])
    @sport = Sport.find(params[:id])

    if @sport.destroy
      flash[:notice] = "\"#{@sport.sportName}\" was deleted successfully."
      redirect_to [@athlete]
    else
      flash.now[:alert] = "There was an error deleting the sport."
      render :show
    end
  end


  private

    def sport_params
      params.require(:sport).permit(:sportName, :active)
    end
end
