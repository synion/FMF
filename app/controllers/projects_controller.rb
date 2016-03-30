class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!, only: [:edit, :update, :new, :create, :destroy, :index]
  before_action :find_project_by_admin, only: [:edit, :update, :destroy]
  
 
  
  # GET /projects
  # GET /projects.json
  def addusers
      @project = Project.find(params[:id])
      @project.users << User.find(params[:user_id])
      respond_to do |format|
        format.html { redirect_to @project, :notice => 'Added.' }
      end
  end

  def removeuser
  
      @project = Project.find(params[:id])
      @user = User.find(params[:user_id])

      if @user
         @project.users.delete(@user)
      end

      respond_to do |format|
        format.html { redirect_to @project, notice: 'User was successfully removed from Project' }
      end
  end



  def index
    @projects = current_admin.projects.all
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @users = User.where(project_id: nil)
    @usersadd = @project.users.all
  end

  # GET /projects/new
  def new
    @project = Project.new
        switchgear = @project.switchgear.build
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    byebug
    @project = Project.new(project_params)
    @project.admin = current_admin

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:name, :admin_id, users_attributes: [:id, :email], switchgear_attributes: [:id, :name])
    end

      def find_project_by_admin
        @project = current_admin.projects.find(params[:id])
      end

     
    
     
end
