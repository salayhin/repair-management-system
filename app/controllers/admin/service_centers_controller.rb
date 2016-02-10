class Admin::ServiceCentersController < ApplicationController
  before_filter :authenticate_admin_user!, except: [:show, :index]
  before_action :set_admin_service_center, only: [:show, :edit, :update, :destroy]
  before_action :load_service_centers

  layout 'admin'
  # GET /admin/service_centers
  # GET /admin/service_centers.json
  def index
    @service_centers = ServiceCenter.all
  end

  # GET /admin/service_centers/1
  # GET /admin/service_centers/1.json
  def show
  end

  # GET /admin/service_centers/new
  def new
    @service_center = ServiceCenter.new
  end

  # GET /admin/service_centers/1/edit
  def edit
  end

  # POST /admin/service_centers
  # POST /admin/service_centers.json
  def create
    @service_center = ServiceCenter.new(admin_service_center_params)

    respond_to do |format|
      if @service_center.save
        format.html { redirect_to admin_service_center_path(@service_center), notice: 'Service center was successfully created.' }
        format.json { render :show, status: :created, location: @service_center }
      else
        format.html { render :new }
        format.json { render json: @service_center.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/service_centers/1
  # PATCH/PUT /admin/service_centers/1.json
  def update
    respond_to do |format|
      if @service_center.update(admin_service_center_params)
        format.html { redirect_to admin_service_center_path(@service_center), notice: 'Service center was successfully updated.' }
        format.json { render :show, status: :ok, location: @service_center }
      else
        format.html { render :edit }
        format.json { render json: @service_center.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/service_centers/1
  # DELETE /admin/service_centers/1.json
  def destroy
    @service_center.destroy
    respond_to do |format|
      format.html { redirect_to admin_service_centers_url, notice: 'Service center was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_admin_service_center
    @service_center = ServiceCenter.find(params[:id])
  end

  def load_service_centers
    @service_centers = ServiceCenter.order('updated_at DESC')
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def admin_service_center_params
    params.require(:service_center).permit(:name, :address, :city, :phone, :is_active)
  end
end
