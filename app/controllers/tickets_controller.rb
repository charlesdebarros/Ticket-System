# frozen_string_literal: true

class TicketsController < ApplicationController
  before_action :set_project
  before_action :set_ticket, only: %i[show edit update delete]

  def new
    @ticket = @project.tickets.build
  end

  def show; end

  def create
    @ticket = @project.tickets.build(ticket_params)

    if @ticket.save
      flash[:notice] = 'Ticket successfull created'
      redirect_to [@project, @ticket]
    else
      flash[:alert] = 'Unable to create your ticket'
      render 'new'
    end
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_ticket
    @ticket = @project.tickets.find(params[:id])
  end

  def ticket_params
    params.require(:ticket).permit(:name, :description)
  end
end
