class SportsController < ApplicationController

  def show
    @athlete = Athlete.find(params[:athlete_id])
    @sport = Sport.find(params[:id])
  end

  def new
    @athlete = Athlete.find(params[:athlete_id])
    @sport = Sport.new
    @swimming = @sport.build_swimming #has-one association
  end

  def create
    @athlete = Athlete.find(params[:athlete_id])
    @sport = @athlete.sports.build(sport_params)
    @swimming = @sport.build_swimming if @sport.swimming.nil? #has-one association

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
    if !@sport.startSportData?

      if @sport.destroy
        flash[:notice] = "\"#{@sport.sportName}\" was deleted successfully."
        redirect_to [@athlete]
      else
        flash.now[:alert] = "There was an error deleting the sport."
        render :show
      end
    end
  end


  private

    def sport_params
      params.require(:sport).permit(:sportName, :active,
        :swimming_attributes=> [:frSCY50, :frSCM50, :frLCM50, :frSCY100, :frSCM100, :frLCM100, :frSCY200, :frSCM200,
          :frLCM200, :frSCY500, :frSCM400, :frLCM400, :frSCY1000, :frSCM800, :frLCM800, :frSCY1650, :frSCM1500,
          :frLCM1500, :bkSCY50, :bkSCM50, :bkLCM50, :bkSCY100, :bkSCM100, :bkLCM100, :bkSCY200, :bkSCM200, :bkLCM200,
          :brSCY50, :brSCM50, :brLCM50, :brSCY100, :brSCM100, :brLCM100, :brSCY200, :brSCM200, :brLCM200, :flSCY50,
          :flSCM50, :flLCM50, :flSCY100, :flSCM100, :flLCM100, :flSCY200, :flSCM200, :flLCM200, :imSCY100, :imSCM100,
          :imSCY200, :imSCM200, :imLCM200, :imSCY400, :imSCM400, :imLCM400]
      )
    end
end
