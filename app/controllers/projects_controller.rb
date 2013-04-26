class ProjectsController < ApplicationController
  def index
  end

  def new
  	@project = Project.new
  end

  def create
  	@project = Project.new(params[:project])
  	@project.save
  	flash[:notice] = "Project Created Succesfully."
  	redirect_to @project
  end

  def show
  	@project = Project.find(params[:id])
  end
end