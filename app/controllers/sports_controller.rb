class SportsController < ApplicationController

  def show
    @athlete = Athlete.find(params[:athlete_id])
    @sport = Sport.find(params[:id])
    @divisionNames = Division.all
  end

  def new
    @athlete = Athlete.find(params[:athlete_id])
    @sport = Sport.new
  end

  def create
    @athlete = Athlete.find(params[:athlete_id])
    @sport = @athlete.sports.build(sport_params)
    buildPerformanceData

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
    @jcMyteams = Myteam.where(sport_id: @sport.id, athlete_id: @sport.athlete_id, division: "Junior College").order(division: :asc, collegeName: :asc).all
    @divisionNames = Division.all
  end

  def update
    @athlete = Athlete.find(params[:athlete_id])
    @sport = Sport.find(params[:id])
    p "inside update"
    p @sport.myteams
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

  # def index_schools
  #   @sport = Sport.find(params[:id])
  #   @athlete = Athlete.find(@sport.athlete_id)
  #   @divisionNames = Division.all
  #   @myteams = Myteam.where(sport_id: @sport.id, athlete_id: @sport.athlete_id ).order(division: :asc, collegeName: :asc).all
  #   if @myteams.count < 1
  #     @Testingcount = "Testing count within controller to build local"
  #     buildMyTeams
  #   else
  #     @Testingcount = "no new teams"
  #   end
  # end

  def index_myprograms
    @sport = Sport.find(params[:id])
    @athlete = Athlete.find(@sport.athlete_id)
    @divisionNames = Division.all
    @myprograms = Myprogram.where(sport_id: @sport.id).all
    if @myprograms.count < 1
      @Testingcount = "Testing count within controller to build local"
      buildMyPrograms
    else
      @Testingcount = "no new Programs"
    end
  end

  # def edit_schools
  #   @sport = Sport.find(params[:id])
  #   @myteams = @sport.myteams.order(division: :asc, collegeName: :asc).all
  #   p "in edit schools now"
  #   p @myteams
  #   @divisionNames = Division.all
  # end

  def edit_myprograms
    @d1myprograms, @d2myprograms, @d3myprograms, @naiamyprograms, @jcmyprograms = [], [], [], [], []
    @sport = Sport.find(params[:id])
    @myprograms = Myprogram.where(sport_id: @sport.id).all
    @myprograms.each do |item|
      if item.program.division === "Division 1"
        @d1myprograms << item
      elsif item.program.division === "Division 2"
        @d2myprograms << item
      elsif item.program.division === "Division 3"
        @d3myprograms << item
      elsif item.program.division === "NAIA"
        @naiamyprograms << item
      elsif item.program.division === "Junior College"
        @jcmyprograms << item
      else
      end
    end
  end

  # def update_schools
  #   p "inside update schools"
  #   #p myteams
  #   @myTeams = Myteam.update(params[:myteams].keys, params[:myteams].values)
  #
  #   # @sport = Sport.find(params[:id])
  #   # p @sport
  #   # @sport.assign_attributes(sport_params)
  #   # p @sport
  #
  #   # if @sport.save
  #   #   flash[:notice] = "Updated Schools successfully."
  #   #   redirect_to [@athlete]
  #   # else
  #   #   flash.now[:alert] = "There was an error saving the new sport. Please try again."
  #   #   render :new
  #   # end
  #
  #
  #   # @myteams = Myteam.find(params[:sport_id])
  #   # @sport.myteams.each do |myTeamsItem|
  #   #   p myTeamsItem
  #   #   #@myteam.assign_attributes!(params[:myTeamsItem])
  #   # end
  #   #p @myteam
  #   # flash[:notice] = "Updated Schools successfully."
  #   # redirect_to [@athlete]
  # end

  private

    def sport_params
      params.require(:sport).permit(:id, :sportName, :active,

        :diving_attributes=> [:oneD1score, :oneD1name, :oneD1date, :oneD2score, :oneD2name, :oneD2date, :oneD3score, :oneD3name,
          :oneD3date, :oneD4score, :oneD4name, :oneD4date, :oneD5score, :oneD5name, :oneD5date, :oneD6score, :oneD6name,
          :oneD6date, :threeD1score, :threeD1name, :threeD1date, :threeD2score, :threeD2name, :threeD2date, :threeD3score, :threeD3name, :threeD3date,
          :threeD4score, :threeD4name, :threeD4date, :threeD5score, :threeD5name, :threeD5date, :threeD6score, :threeD6name, :threeD6date, :tenD1score,
          :tenD1name, :tenD1date, :tenD2score, :tenD2name, :tenD2date, :tenD3score, :tenD3name, :tenD3date, :tenD4score, :tenD4name,
          :tenD4date, :tenD5score, :tenD5name, :tenD5date, :tenD6score, :tenD6name, :tenD6date],

        :myteam_attributes=> [ :id, :sport, :coach, :division, :collegeName, :public, :sport_id, :athlete_id ],

        :myprogram_attributes=> [:id, :public, :sport_id, :program_id, :_destroy ],

        :program_attributes=> [:id, :sport, :coach, :email1address, :coachPhone, :division,
          :region, :athleticWebsite, :blank, :sir, :firstName, :lastName, :collegeName,
          :address, :stateAndZip],

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
        @waterpolo = @sport.build_waterpolo if @sport.waterpolo.nil? #has-one association
      else
      end
    end

    def buildMyPrograms
      @teams = []
      @programs = Program.where(sport: @sport.sportName).order(collegeName: :desc).all
      @programs.each do |item|
        team = {
          public:         false,
          sport_id:       @sport.id,
          program_id:     item.id
        }

        @teams << team
      end
      p "finished load MY index_myprograms_on_sport_id"
      columns = [ :public, :sport_id, :program_id ]
      Myprogram.import columns, @teams
   end

end
