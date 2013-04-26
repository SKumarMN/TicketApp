class ProjectsController < ApplicationController
  before_filter :authorize_admin, except: [:show,:index]
  before_filter :find_project, only: [:show,:edit,:destroy,:update]
  def index
    @projects = Project.all
  end

  def new
  	@project = Project.new
  end

  def create
  	@project = Project.new(params[:project])
    if(@project.save)
  	flash[:notice] = "Project Created Succesfully."
    redirect_to @project
    else
     flash[:alert] = "Project Creation Failed." 
     render 'new'
    end
  end

  def show
  	
  end

  def edit
     
  end

  def update
     
    if @project.update_attributes(params[:project]) 
       flash[:notice] = 'Project Updated Successfully.'
       redirect_to @project
    else
       flash[:alert] = 'Project updation Fail.'
       render 'edit'
    end 
     
  end

  def destroy
   
    if @project.destroy
       flash[:notice] = 'Project deleted Succesfully'
       redirect_to root_url
    else
       flash[:alert] = 'Project deleted Fail.'
       redirect_to root_url
    end 
    
  end


  private
    def find_project
      @project = Project.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      flash[:alert] = "The project you are look for "+
                      "could not be found."
      redirect_to projects_path                
        
    end

    def authorize_admin!
        authenticate_user!
        unless current_user.admin?
          flash[:alert] = "You are not a admin"
          redirect_to root_path
        end      
    end
end
