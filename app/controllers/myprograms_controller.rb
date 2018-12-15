class MyprogramsController < ApplicationController

    def update_myprograms
      p "inside update programs of myprograms controller"
      if params[:d1myprograms].present?
        Myprogram.update(params[:d1myprograms].keys, params[:d1myprograms].values)
      end
      if params[:d2myprograms].present?
        Myprogram.update(params[:d2myprograms].keys, params[:d2myprograms].values)
      end
      if params[:d3myprograms].present?
        Myprogram.update(params[:d3myprograms].keys, params[:d3myprograms].values)
      end
      if params[:naiamyprograms].present?
        Myprogram.update(params[:naiamyprograms].keys, params[:naiamyprograms].values)
      end
      if params[:jcmyprograms].present?
        Myprogram.update(params[:jcmyprograms].keys, params[:jcmyprograms].values)
      end
      flash[:notice] = "Updated programs successfully."
      redirect_to :controller => 'athletes', :action => 'index'
    end


  private

    def myprogram_params
      params.require(:program).permit(:public)
    end

end
