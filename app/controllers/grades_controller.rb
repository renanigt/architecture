class GradesController < ApplicationController
  before_action :set_grade, only: [:done, :update, :destroy]

  def create
    @grade = Grade.new(grade_params)

    if @grade.save
      render json: @grade, status: :created
    else
      render json: @grade.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @grade.archive!
    @grade.save
    
    render json: { status: :ok, message: "Grade successfully archived" }
  end

  private
    def grade_params
      params.require(:grade).permit(:grade, :project_id)
    end

    def set_grade
      @grade = Grade.find(params[:id])
    end
end
