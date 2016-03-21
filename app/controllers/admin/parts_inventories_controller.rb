class Admin::PartsInventoriesController < ApplicationController
  before_filter :authenticate_admin_user!, except: [:show, :index]
  before_action :set_admin_parts_inventory, only: [:show, :edit, :update, :destroy]

  layout 'admin'
  # GET /admin/parts_inventories
  # GET /admin/parts_inventories.json
  def index
    @parts_inventories = PartsInventory.all
  end

  # GET /admin/parts_inventories/1
  # GET /admin/parts_inventories/1.json
  def show
  end

  # GET /admin/parts_inventories/new
  def new
    @parts_inventory = PartsInventory.new
  end

  # GET /admin/parts_inventories/1/edit
  def edit
  end

  # POST /admin/parts_inventories
  # POST /admin/parts_inventories.json
  def create
    @parts_inventory = PartsInventory.new(admin_parts_inventory_params)

    respond_to do |format|
      if @parts_inventory.save
        format.html { redirect_to admin_parts_inventory_path(@parts_inventory), notice: 'Parts inventory was successfully created.' }
        format.json { render :show, status: :created, location: @parts_inventory }
      else
        format.html { render :new }
        format.json { render json: @parts_inventory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/parts_inventories/1
  # PATCH/PUT /admin/parts_inventories/1.json
  def update
    respond_to do |format|
      if @parts_inventory.update(admin_parts_inventory_params)
        format.html { redirect_to admin_parts_inventory_path(@parts_inventory), notice: 'Parts inventory was successfully updated.' }
        format.json { render :show, status: :ok, location: @parts_inventory }
      else
        format.html { render :edit }
        format.json { render json: @parts_inventory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/parts_inventories/1
  # DELETE /admin/parts_inventories/1.json
  def destroy
    @parts_inventory.destroy
    respond_to do |format|
      format.html { redirect_to admin_parts_inventories_url, notice: 'Parts inventory was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_admin_parts_inventory
    @parts_inventory = PartsInventory.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def admin_parts_inventory_params
    params.require(:parts_inventory).permit(:name, :identification_no, :stock, :used, :description, :status)
  end
end
