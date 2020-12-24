class ProjectsController < ApplicationController
  before_action :find_project, only: %i[show edit update]
  def index
    @projects = Project.all.order('created_at DESC')
  end

  def show; end

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

  def edit; end

  def update
    if @project.update(project_params)
      flash[:notice] = 'Project updated successfully.'
      redirect_to @project
    else
      flash.now[:alert] = 'Project has not been updated.'
      render 'edit'
    end
  end

  private

  def find_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :description)
  end
end
