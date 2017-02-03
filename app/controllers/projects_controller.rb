class ProjectsController < ApplicationController
  before_action :set_project, only: [:done, :update, :destroy]

  def index
    @projects = Project.where(archived: false)
    render json: @projects, status: :ok
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      render json: @project, status: :created
    else
      render json: @project.errors, status: :unprocessable_entity
    end
  end

  def update
    if @project.update(project_params)
      render json: @project, status: :ok
    else
      render json: @project.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @project.archive
    @project.save
    
    render json: { status: :ok, message: "Project successfully archived" }
  end

  def done
    @project = Project.find(params[:id])
    @project.done
    @project.save

    render json: { status: :ok, message: "Project done successfully" }
  end

  private
    def project_params
      params.require(:project).permit(:name, :client, grades_attributes:[:grade])
    end

    def set_project
      @project = Project.find(params[:id])
    end
end
