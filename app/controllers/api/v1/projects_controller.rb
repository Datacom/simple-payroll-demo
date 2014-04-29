module Api::V1
  class ProjectsController < ApiController
    # GET /projects
    # GET /projects.json
    def index
      @projects = Project.all
      render json: @projects
    end

    # GET /projects/1
    # GET /projects/1.json
    def show
      @project = Project.find(params[:id])
      render json: @project
    end
  end
end