class Admin::FinalStatusesController < ApplicationController
  before_filter :authenticate_admin_user!, except: [:show, :index]
  before_action :set_admin_final_status, only: [:show, :edit, :update, :destroy]
  before_action :load_final_statuses

  layout 'admin'
  # GET /admin/final_statuses
  # GET /admin/final_statuses.json
  def index
    @final_statuses = FinalStatus.all
  end

  # GET /admin/final_statuses/1
  # GET /admin/final_statuses/1.json
  def show
  end

  # GET /admin/final_statuses/new
  def new
    @final_status = FinalStatus.new
  end

  # GET /admin/device_statuses/1/edit
  def edit
  end

  # POST /admin/final_statuses
  # POST /admin/final_statuses.json
  def create
    @final_status = FinalStatus.new(admin_final_status_params)

    respond_to do |format|
      if @final_status.save
        format.html { redirect_to admin_final_status_path(@final_status), notice: 'Final status was successfully created.' }
        format.json { render :show, status: :created, location: @final_status }
      else
        format.html { render :new }
        format.json { render json: @final_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/final_statuses/1
  # PATCH/PUT /admin/final_statuses/1.json
  def update
    respond_to do |format|
      if @final_status.update(admin_final_status_params)
        format.html { redirect_to admin_final_status_path(@final_status), notice: 'Final Status was successfully updated.' }
        format.json { render :show, status: :ok, location: @final_status }
      else
        format.html { render :edit }
        format.json { render json: @final_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/final_statuses/1
  # DELETE /admin/final_statuses/1.json
  def destroy
    @final_status.destroy
    respond_to do |format|
      format.html { redirect_to admin_final_statuses_url, notice: 'Final Status was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_admin_final_status
    @final_status = FinalStatus.find(params[:id])
  end

  def load_final_statuses
    @final_statuses = FinalStatus.order('updated_at DESC')
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def admin_final_status_params
    params.require(:final_status).permit(:name, :status)
  end
end
