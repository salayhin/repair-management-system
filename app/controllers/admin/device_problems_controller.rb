class Admin::DeviceProblemsController < ApplicationController
  before_filter :authenticate_admin_user!, except: [:show, :index]
  before_action :set_admin_device_problem, only: [:show, :edit, :update, :destroy]
  before_action :load_device_problems

  layout 'admin'
  # GET /admin/device_problems
  # GET /admin/device_problems.json
  def index
    @device_problems = DeviceProblem.all
  end

  # GET /admin/device_problems/1
  # GET /admin/device_problems/1.json
  def show
  end

  # GET /admin/device_problems/new
  def new
    @device_problem = DeviceProblem.new
  end

  # GET /admin/device_problems/1/edit
  def edit
  end

  # POST /admin/device_problems
  # POST /admin/device_problems.json
  def create
    @device_problem = DeviceProblem.new(admin_device_problem_params)

    respond_to do |format|
      if @device_problem.save
        format.html { redirect_to admin_device_problem_path(@device_problem), notice: 'Device problem was successfully created.' }
        format.json { render :show, status: :created, location: @device_problem }
      else
        format.html { render :new }
        format.json { render json: @device_problem.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/device_problems/1
  # PATCH/PUT /admin/device_problems/1.json
  def update
    respond_to do |format|
      if @device_problem.update(admin_device_problem_params)
        format.html { redirect_to admin_device_problem_path(@device_problem), notice: 'Device problem was successfully updated.' }
        format.json { render :show, status: :ok, location: @device_problem }
      else
        format.html { render :edit }
        format.json { render json: @device_problem.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/device_problems/1
  # DELETE /admin/device_problems/1.json
  def destroy
    @device_problem.destroy
    respond_to do |format|
      format.html { redirect_to admin_service_centers_url, notice: 'Device Problem was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_admin_device_problem
    @device_problem = DeviceProblem.find(params[:id])
  end

  def load_device_problems
    @device_problems = DeviceProblem.order('updated_at DESC')
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def admin_device_problem_params
    params.require(:device_problem).permit(:name, :description, :status)
  end
end
