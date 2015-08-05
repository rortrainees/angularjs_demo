class StudentsController < ApplicationController

  before_action :get_student, except: [:index, :create]
  respond_to :html, :json

  def index
    @student = Student.all
    respond_with(@students) do |format|
      format.json { render :json => @student.as_json }
      format.html
    end
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      render json: @student.as_json, status: :ok
    else
      render json: {student: @student.errors, status: :no_content}
    end
  end      

  def show
    respond_with(@student.as_json)
  end

  def update
    if @student.update_attributes(student_params)
      render json: @student.as_json, status: :ok 
    else
      render json: {user: @student.errors, status: :unprocessable_entity}
    end
  end

  def destroy
    @student.destroy
    render json: {status: :ok}
  end

  private

  def student_params
    unless params["student"].blank?
      params["student"] = params["student"]
      params["student"]
    end
    params.fetch(:student, {}).permit(:name, :clas, :age)
  end

  def get_student
    @student = Student.find(params[:id])
    render json: {status: :not_found} unless @student
  end

end

