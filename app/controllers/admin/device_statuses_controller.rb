class Admin::DeviceStatusesController < ApplicationController
  before_filter :authenticate_admin_user!, except: [:show, :index]
  before_action :set_admin_device_status, only: [:show, :edit, :update, :destroy]
  before_action :load_device_statuses

  layout 'admin'
  # GET /admin/device_statuses
  # GET /admin/device_statuses.json
  def index
    @device_statuses = DeviceStatus.all
  end

  # GET /admin/device_statuses/1
  # GET /admin/device_statuses/1.json
  def show
  end

  # GET /admin/device_statuses/new
  def new
    @device_status = DeviceStatus.new
  end

  # GET /admin/device_statuses/1/edit
  def edit
  end

  # POST /admin/device_statuses
  # POST /admin/device_statuses.json
  def create
    @device_status = DeviceStatus.new(admin_device_status_params)

    respond_to do |format|
      if @device_status.save
        format.html { redirect_to admin_device_status_path(@device_status), notice: 'Device status was successfully created.' }
        format.json { render :show, status: :created, location: @device_status }
      else
        format.html { render :new }
        format.json { render json: @device_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/device_statuses/1
  # PATCH/PUT /admin/device_statuses/1.json
  def update
    respond_to do |format|
      if @device_status.update(admin_device_status_params)
        format.html { redirect_to admin_device_status_path(@device_status), notice: 'Device Status was successfully updated.' }
        format.json { render :show, status: :ok, location: @device_status }
      else
        format.html { render :edit }
        format.json { render json: @device_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/device_statuses/1
  # DELETE /admin/device_statuses/1.json
  def destroy
    @device_status.destroy
    respond_to do |format|
      format.html { redirect_to admin_device_statuses_url, notice: 'Device Status was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_admin_device_status
    @device_status = DeviceStatus.find(params[:id])
  end

  def load_device_statuses
    @device_statuses = DeviceStatus.order('updated_at DESC')
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def admin_device_status_params
    params.require(:device_status).permit(:name, :status, :activity_status_id)
  end
end
