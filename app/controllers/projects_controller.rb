# frozen_string_literal: true

class ProjectsController < ApplicationController
  before_action :set_project, only: %i[show edit update destroy]
  def index
    @projects = policy_scope(Project)
  end

  def show
    authorize @project, :show?
  end

  def edit
    authorize @project, :edit?
  end

  def update
    authorize @project, :update?
    if @project.update(project_params)
      flash[:notice] = 'Project updated successfully.'
      redirect_to @project
    else
      flash.now[:alert] = 'Project has not been updated.'
      render 'edit'
    end
  end

  private

  def set_project
    @project = Project.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = 'The project you are looking for cannot be found!'
    redirect_to projects_path
  end

  def project_params
    params.require(:project).permit(:name, :description)
  end
end
