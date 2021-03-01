# frozen_string_literal: true

# Manages tickets associated to single projects
class TicketsController < ApplicationController
  before_action :set_project
  before_action :set_ticket, only: %i[show edit update destroy]

  def show
    authorize @ticket, :show?
  end

  def new
    @ticket = @project.tickets.build
    authorize @ticket, :create?
  end

  def create
    @ticket = @project.tickets.build(ticket_params)
    @ticket.author = current_user
    authorize @ticket, :create?

    if @ticket.save
      flash[:notice] = 'Ticket successfully created'
      redirect_to [@project, @ticket]
    else
      flash[:alert] = 'Unable to create your ticket'
      render 'new'
    end
  end

  def edit
    authorize @ticket, :edit?
  end

  def update
    authorize @ticket, :update?

    if @ticket.update(ticket_params)
      flash[:notice] = 'Ticket successfully updated.'
      redirect_to [@project, @ticket]
    else
      flash.now[:alert] = 'Unable to update ticket.'
      render 'edit'
    end
  end

  def destroy
    authorize @ticket, :destroy?

    @ticket.destroy
    flash[:notice] = 'Ticket successfully deleted.'

    redirect_to @project
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_ticket
    @ticket = @project.tickets.find(params[:id])
  end

  def ticket_params
    params.require(:ticket).permit(:name, :description, :attachment, :attachment_cache)
  end
end
