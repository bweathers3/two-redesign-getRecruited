class AthletesController < ApplicationController
  def index
    @athletes = Athlete.all
  end

  def show
  end

  def new
  end

  def edit
  end
end
