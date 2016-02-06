class Admin::DeviceModelsController < ApplicationController
  before_action :authenticate_admin_user!, only: [:create, :update, :edit, :new]
  before_action :authenticate_user!
  before_action :set_admin_device_model, only: [:show, :edit, :update, :destroy]
  before_action :load_device_brands

  layout 'admin'
  
  # GET /admin/device_models
  # GET /admin/device_models.json
  def index
    @device_models = DeviceModel.all
  end

  # GET /admin/device_models/1
  # GET /admin/device_models/1.json
  def show
  end

  # GET /admin/device_models/new
  def new
    @device_model = DeviceModel.new
  end

  # GET /admin/device_models/1/edit
  def edit
  end

  # POST /admin/device_models
  # POST /admin/device_models.json
  def create
    @device_model = DeviceModel.new(admin_device_model_params)

    respond_to do |format|
      if @device_model.save
        format.html { redirect_to admin_device_model_path(@device_model), notice: 'Device model was successfully created.' }
        format.json { render :show, status: :created, location: @device_model }
      else
        format.html { render :new }
        format.json { render json: @device_model.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/device_models/1
  # PATCH/PUT /admin/device_models/1.json
  def update
    respond_to do |format|
      if @device_model.update(admin_device_model_params)
        format.html { redirect_to admin_device_model_path(@device_model), notice: 'Device model was successfully updated.' }
        format.json { render :show, status: :ok, location: @device_model }
      else
        format.html { render :edit }
        format.json { render json: @device_model.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/device_models/1
  # DELETE /admin/device_models/1.json
  def destroy
    @device_model.destroy
    respond_to do |format|
      format.html { redirect_to admin_device_models_url, notice: 'Device model was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_admin_device_model
    @device_model = DeviceModel.find(params[:id])
  end

  def load_device_brands
    @device_brands = DeviceBrand.all
    @device_models = DeviceModel.all.last(5)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def admin_device_model_params
    params.require(:device_model).permit(:name, :logo, :device_brand_id)
  end
end
