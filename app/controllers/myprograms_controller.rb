class MyprogramsController < ApplicationController

  private

  def myprogram_params
    params.require(:program).permit(:public)
  end
end
