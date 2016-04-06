class OtdfsController < ApplicationController
	def show
		@otdf = Otdf.find(params[:id])
	end

	def new
		@otdf = Otdf.new
		@switchgear = params[:switchgear_id]
	end

	def edit
		@otdf = Otdf.find(params[:id])
	end

	def create 
		@otdf = Otdf.new(otdf_params)
		respond_to do |format|
	      	if @otdf.save
	        	format.html { redirect_to @otdf, notice: 'Success.' }
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
		@otdf = Otdf.find(params[:id])
	    @otdf.destroy
	    respond_to do |format|
	      	format.html { redirect_to switchgear_path, notice: 'Otdf was successfully destroyed.' }
	    end
	end	
	private
	def otdf_params
		params.require(:otdf).permit(:direct, :size, :switchgear_id)
	end	
end
