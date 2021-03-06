class SwitchgearsController < ApplicationController

  def show
    @switchgear = Switchgear.find(params[:id])
    @otdfs = @switchgear.otdfs.all
    @project = params[:project_id]
  end

  def destroy
    project = Project.find(params[:project_id])
    @switchgear = project.switchgears.find(params[:id])
    @switchgear.destroy
    respond_to do |format|
      format.html { redirect_to project_url(@project), notice: 'Otdf was successfully destroyed.' }
    end
  end
end
