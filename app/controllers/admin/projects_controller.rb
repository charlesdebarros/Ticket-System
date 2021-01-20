# frozen_string_literal: true

module Admin
  class ProjectsController < Admin::ApplicationController
    before_action :set_project, only: %i[destroy]
    def new
      @project = Project.new
    end

    def create
      @project = Project.new(project_params)
      if @project.save
        flash[:notice] = 'Project successfully created.'
        redirect_to @project
      else
        flash.now[:alert] = 'Project has not been created.'
        render 'new'
      end
    end

    def destroy
      @project.destroy
      flash[:notice] = 'Project successfully deleted!'

      redirect_to projects_path
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
end
