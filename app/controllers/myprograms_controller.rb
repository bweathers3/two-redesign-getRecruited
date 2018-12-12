class MyprogramsController < ApplicationController

    def update_myprograms
      p "inside update programs of myprograms controller"
      Myprogram.update(params[:d1myprograms].keys, params[:d1myprograms].values)
      Myprogram.update(params[:d2myprograms].keys, params[:d2myprograms].values)
      Myprogram.update(params[:d3myprograms].keys, params[:d3myprograms].values)
      Myprogram.update(params[:naiamyprograms].keys, params[:naiamyprograms].values)
      Myprogram.update(params[:jcmyprograms].keys, params[:jcmyprograms].values)
      flash[:notice] = "Updated programs successfully."
      redirect_to :controller => 'athletes', :action => 'index'
    end


  private

    def myprogram_params
      params.require(:program).permit(:public)
    end

end
