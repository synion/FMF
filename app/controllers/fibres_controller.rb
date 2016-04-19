class FibresController < ApplicationController



	def show
    set_fibre
  end

  # GET /projects/new
  def new
    @project = Project.find params[:project_id] 
    @switchgear = Switchgear.find params[:switchgear_id]
    @otdf = Otdf.find params[:otdf_id]
    @fibre = Fibre.new(otdf: @otdf)
  end

  # GET /projects/1/edit
  def edit
    set_fibre
  end

  # POST /projects
  # POST /projects.json
  def create
    otdf = Otdf.find(params[:otdf_id])
    @fibre = otdf.fibres.create(fibre_params)
    respond_to do |format|
      if @fibre.save
        format.html { redirect_to otdf, notice: 'Fibre was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
     otdf = Otdf.find(params[:otdf_id])
    @fibre = otdf.fibres.create(fibre_params)
    respond_to do |format|
      if @fibre.update(fibre_params)
        format.html { redirect_to otdf, notice: 'Fibre was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    set_fibre
    @fibre.destroy
    respond_to do |format|
      format.html { redirect_to (otdf_fibres_url)}
      
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
   
    # Never trust parameters from the scary internet, only allow the white list through.
    def fibre_params
      params.require(:fibre).permit(:latitude, :longitude, :f_color, :otdf_id, :number_in_otdf, :address)
    end

     def set_fibre
        otdf = Otdf.find(params[:otdf_id])
        @fibre = otdf.fibres.find(params[:id])
     end

     
    
     
end



