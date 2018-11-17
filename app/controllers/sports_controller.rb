class SportsController < ApplicationController

  def show
    @athlete = Athlete.find(params[:athlete_id])
    @sport = Sport.find(params[:id])
    @myTeams = @sport.programs.where(sport: @sport.sportName)
    puts "****************"
    p @myTeams
    puts "****************"
  end

  def new
    @athlete = Athlete.find(params[:athlete_id])
    @sport = Sport.new
  end

  def create
    @athlete = Athlete.find(params[:athlete_id])
    @sport = @athlete.sports.build(sport_params)
    buildPerformanceData
    buildProgramAndSportJoin

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
        :diving_attributes=> [:oneD1score, :oneD1name, :oneD1date, :oneD2score, :oneD2name, :oneD2date, :oneD3score, :oneD3name,
          :oneD3date, :oneD4score, :oneD4name, :oneD4date, :oneD5score, :oneD5name, :oneD5date, :oneD6score, :oneD6name,
          :oneD6date, :threeD1score, :threeD1name, :threeD1date, :threeD2score, :threeD2name, :threeD2date, :threeD3score, :threeD3name, :threeD3date,
          :threeD4score, :threeD4name, :threeD4date, :threeD5score, :threeD5name, :threeD5date, :threeD6score, :threeD6name, :threeD6date, :tenD1score,
          :tenD1name, :tenD1date, :tenD2score, :tenD2name, :tenD2date, :tenD3score, :tenD3name, :tenD3date, :tenD4score, :tenD4name,
          :tenD4date, :tenD5score, :tenD5name, :tenD5date, :tenD6score, :tenD6name, :tenD6date],

        :swimming_attributes=> [:frSCY50, :frSCM50, :frLCM50, :frSCY100, :frSCM100, :frLCM100, :frSCY200, :frSCM200,
          :frLCM200, :frSCY500, :frSCM400, :frLCM400, :frSCY1000, :frSCM800, :frLCM800, :frSCY1650, :frSCM1500,
          :frLCM1500, :bkSCY50, :bkSCM50, :bkLCM50, :bkSCY100, :bkSCM100, :bkLCM100, :bkSCY200, :bkSCM200, :bkLCM200,
          :brSCY50, :brSCM50, :brLCM50, :brSCY100, :brSCM100, :brLCM100, :brSCY200, :brSCM200, :brLCM200, :flSCY50,
          :flSCM50, :flLCM50, :flSCY100, :flSCM100, :flLCM100, :flSCY200, :flSCM200, :flLCM200, :imSCY100, :imSCM100,
          :imSCY200, :imSCM200, :imLCM200, :imSCY400, :imSCM400, :imLCM400],

        :waterpolo_attributes=> [:frSCY50, :frSCY100, :frSCY200, :height, :weight, :jersey, :goalie, :center,
          :defender, :attacker, :utility, :right, :left, :nationalTeamExp]

      )
    end

    def buildPerformanceData
      if @sport.sportName === "Men's Swimming" || @sport.sportName === "Women's Swimming"
        @swimming = @sport.build_swimming if @sport.swimming.nil? #has-one association
      elsif @sport.sportName === "Men's Diving" || @sport.sportName === "Women's Diving"
        @diving = @sport.build_diving if @sport.diving.nil? #has-one association
      elsif @sport.sportName === "Men's Water Polo" || @sport.sportName === "Women's Water Polo"
        @diving = @sport.build_diving if @sport.diving.nil? #has-one association
      else

      end
    end

    def buildProgramAndSportJoin
      @programs = Program.where(sport: @sport.sportName).order(collegeName: :asc).all
      @sport.programs << @programs
    end

end
