class ProgramsController < ApplicationController
  def index
    #@programs = Program.all
    programSport = "Women's Water Polo"

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
end
