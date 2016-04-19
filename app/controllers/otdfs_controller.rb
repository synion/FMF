class OtdfsController < ApplicationController
	def show
		@project = Project.find params[:project_id] 
		@switchgear = Switchgear.find params[:switchgear_id]
		set_otdf
		@fibres = @otdf.fibres.all
	end

	def new
		@project = Project.find params[:project_id] 
		@switchgear = Switchgear.find params[:switchgear_id]
		@otdf = Otdf.new(switchgear: @switchgear)
	end

	def edit
		set_otdf
	end

	def create 
		@project = Project.find params[:project_id] 
		@switchgear = Switchgear.find params[:switchgear_id]
		@otdf = Otdf.new(otdf_params)
		respond_to do |format|
	      	if @otdf.save
	        	format.html { redirect_to [@project, @switchgear, @otdf], notice: 'Success.' }
	      	else
	        	format.html { render :new } 
	    	end
    	end
	end

	def update 
		
		respond_to do |format|
	      	if @otdf.update
	        	format.html { redirect_to @otdf, notice: 'Success.' }
	      	else
	        	format.html { render :new } 
	    	end
    	end
	end

	def destroy
		set_otdf
	    @otdf.destroy
	    respond_to do |format|
	      	format.html { redirect_to switchgear_path, notice: 'Otdf was successfully destroyed.' }
	    end
	end	
	private
	def otdf_params
		params.require(:otdf).permit(:direct, :size, :switchgear_id, switchgear: [:id])
	end	

	def set_otdf
		@otdf = Otdf.find(params[:id])
	end
end
