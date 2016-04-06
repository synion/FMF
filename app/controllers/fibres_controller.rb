class FibresController < ApplicationController



	def show
  	end

  # GET /projects/new
  def new
    @fibre = Fibre.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    @fibre = Fibre.new(fibre_params)
    respond_to do |format|
      if @fibre.save
        format.html { redirect_to @fibre, notice: 'Fibre was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @fibre.update(fibre_params)
        format.html { redirect_to @fibre, notice: 'Fibre was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @fibre.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'fibre was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
   
    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:fibre).permit(:latitude, :longitude, :f_color, :otdf_id, :number_in_otdf, :address)
    end

     

     
    
     
end


end
