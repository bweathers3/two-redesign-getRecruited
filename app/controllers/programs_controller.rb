class ProgramsController < ApplicationController
  def index
    @programs = Program.all
  end

  def import
    Program.import(params[:file])

    redirect_to root_url, notice: "Program Data Imported!"
  end
end
