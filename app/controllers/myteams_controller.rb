class MyteamsController < ApplicationController

  def index
    @sport = Sport.find(params[:sport_id])
    @athlete = Athlete.find(@sport.athlete_id)
    @divisionNames = Division.all
    @myteams = Myteam.where(sport_id: @sport.id, athlete_id: @sport.athlete_id ).order(division: :asc, collegeName: :asc).all
    if @myteams.count < 1
      @Testingcount = "Testing count within controller to build local"
      buildMyTeams
    else
      @Testingcount = "no new teams"
    end
  end

  def edit_schools
    @sport = Sport.find(params[:sport_id])
    @myteams = Myteam.where(params[:sport_id])
  p @myteams
    # @myteams[0].each do |item|
    #   athlete = item.athlete_id
    # end
    #@athlete = Athlete.find(params[:id])
    @divisionNames = Division.all
  end

  def update_schools
    #@sport = Sport.find(params[:sport_id])
    #@athlete = Athlete.find(@sport.athlete_id)
    @myteams = Myteam.find(params[:myteams_ids])
    # @myteams.each do |myTeamsItem|
    #   @myteam.assign_attributes!(params[:myTeamsItem])
    # end
    #p @myteam
    flash[:notice] = "Updated Schools successfully."
    redirect_to [@athlete]
  end


private

  def myteam_params
    params.require(:myteam).permit(:sport, :coach, :division, :collegeName, :public,
      :sport_id, :athlete_id
    )
  end

  def buildMyTeams
    @teams = []
    @programs = Program.where(sport: @sport.sportName).order(collegeName: :asc).all
    @programs.each do |item|
      team = {
        sport:          item.sport,
        coach:          item.coach,
        division:       item.division,
        collegeName:    item.collegeName,
        public:         false,
        sport_id:       @sport.id,
        athlete_id:     @athlete.id
      }

      @teams << team
    end
    p "finished load teams"
    columns = [ :sport, :coach, :division, :collegeName, :public,
      :sport_id, :athlete_id ]
    Myteam.import columns, @teams
 end


end
