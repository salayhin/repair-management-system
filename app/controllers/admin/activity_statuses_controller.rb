class Admin::ActivityStatusesController < ApplicationController
  before_filter :authenticate_admin_user!, except: [:show, :index]
  before_action :set_admin_activity_status, only: [:show, :edit, :update, :destroy]
  before_action :load_activity_statuses

  layout 'admin'
  # GET /admin/activity_statuses
  # GET /admin/activity_statuses.json
  def index
    @activity_statuses = ActivityStatus.all
  end

  # GET /admin/activity_statuses/1
  # GET /admin/activity_statuses/1.json
  def show
  end

  # GET /admin/activity_statuses/new
  def new
    @activity_status = ActivityStatus.new
  end

  # GET /admin/activity_statuses/1/edit
  def edit
  end

  # POST /admin/activity_statuses
  # POST /admin/activity_statuses.json
  def create
    @activity_status = ActivityStatus.new(admin_activity_status_params)

    respond_to do |format|
      if @activity_status.save
        format.html { redirect_to admin_activity_status_path(@activity_status), notice: 'Activity status was successfully created.' }
        format.json { render :show, status: :created, location: @activity_status }
      else
        format.html { render :new }
        format.json { render json: @activity_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/activity_statuses/1
  # PATCH/PUT /admin/activity_statuses/1.json
  def update
    respond_to do |format|
      if @activity_status.update(admin_activity_status_params)
        format.html { redirect_to admin_activity_status_path(@activity_status), notice: 'Activity Status was successfully updated.' }
        format.json { render :show, status: :ok, location: @activity_status }
      else
        format.html { render :edit }
        format.json { render json: @activity_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/activity_statuses/1
  # DELETE /admin/activity_statuses/1.json
  def destroy
    @activity_status.destroy
    respond_to do |format|
      format.html { redirect_to admin_activity_statuses_url, notice: 'Activity Status was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_admin_activity_status
    @activity_status = ActivityStatus.find(params[:id])
  end

  def load_activity_statuses
    @activity_statuses = ActivityStatus.order('updated_at DESC')
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def admin_activity_status_params
    params.require(:activity_status).permit(:name, :status)
  end
end
