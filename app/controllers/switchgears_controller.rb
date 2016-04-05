class SwitchgearsController < ApplicationController
  def show
  	@switchgear = Switchgear.find(params[:id])
 	@otdfs = @switchgear.otdfs.all
  end



  private

  def project_params
      params.require(:project).permit(:description, :project_id, otdfs_attributes: [:id, :type, :direct])
    end
end
