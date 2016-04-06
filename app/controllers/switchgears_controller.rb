class SwitchgearsController < ApplicationController
  def show
  	@switchgear = Switchgear.find(params[:id])
 	@otdfs = @switchgear.otdfs.all
  end



  
end
