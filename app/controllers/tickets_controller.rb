class TicketsController < ApplicationController
  before_filter :authenticate_user!, except:[:index, :show]
  before_filter :find_project
  before_filter :find_ticket, only: [:show,:edit,:update,:destroy]
  def new
  	@ticket = @project.tickets.build
  end

  def create
  	@ticket = @project.tickets.build(params[:ticket])
    @ticket.user = current_user
  	if @ticket.save
  		flash[:notice] = "Ticket created"
  		redirect_to [@project,@ticket]
  		
  	else
  		flash[:alert] = "Ticket creation failed"
  		render 'new'
  		
  	end
  	
  end

  def show
  	
  end

  def index
  	
  end

  def edit
  	
  end

  def update

  	if @ticket.update_attributes(params[:ticket])
  		flash[:notice] = "Ticket updated Succesfully"
  		redirect_to project_ticket_path(@project,@ticket)		
  	else
  		flash[:alert] = "Ticket updation fail"
  		render 'edit'
  	end
  end

  def destroy
  	if @ticket.destroy
       flash[:notice] = 'Ticket deleted Succesfully'
       redirect_to project_tickets_path(@project)
    else
       flash[:alert] = 'Ticket deleted Fail.'
       redirect_to project_ticket_path(@project,@ticket)
    end 
  end

  private
  	def find_project
  		@project = Project.find(params[:project_id])
  		
  	end

  	def find_ticket
  		@ticket = @project.tickets.find(params[:id])  		
  	end
end
