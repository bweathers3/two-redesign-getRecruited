class ProgramsController < ApplicationController
  def index
    #@programs = Program.all
    programSport = "Women's Swimming"

    @d1programs = Program.where(sport: programSport, division: "Division 1").order(division: :asc, collegeName: :asc).all
    @d2programs = Program.where(sport: programSport, division: "Division 2").order(division: :asc, collegeName: :asc).all
    @d3programs = Program.where(sport: programSport, division: "Division 3").order(division: :asc, collegeName: :asc).all
    @naiaprograms = Program.where(sport: programSport, division: "NAIA").order(division: :asc, collegeName: :asc).all
    @jcprograms = Program.where(sport: programSport, division: "Junior College").order(division: :asc, collegeName: :asc).all

  end

  def import
    Program.import(params[:file])
    redirect_to root_url, notice: "Program Data Imported!"
  end

  private

  def program_params
    params.require(:program).permit(:sport, :coach, :email1address, :coachPhone, :division,
      :region, :athleticWebsite, :blank, :sir, :firstName, :lastName, :collegeName,
      :address, :stateAndZip,

      #:myprogram_attributes=> [:id, :public, :sport_id, :program_id, :_destroy ],
      :sport_attributes=> [:id, :sportName, :active]
      )
  end
end
