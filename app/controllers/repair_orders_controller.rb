class RepairOrdersController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_repair_order, only: [:show, :edit, :update, :destroy]
  before_filter :can_crud?, only: [:create, :edit, :new, :update]

  layout 'admin'
  # GET /repair_orders
  # GET /repair_orders.json
  def index
    if current_user.is_super_admin?
      @repair_orders = RepairOrder.includes(:repair_information, :repair_assignments).all
    else
      @repair_orders = current_user.profile.service_center.repair_orders.includes(:repair_information, :repair_assignments)
    end
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "repair_orders",
               template: 'repair_orders/index.pdf.erb',
               encoding: 'utf8'
      end
    end
  end

  # GET /repair_orders/1
  # GET /repair_orders/1.json
  def show
    @repair_order = RepairOrder.includes(:device_model, :device_brand, :service_center).find(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "invoice",
               template: 'repair_orders/show.pdf.erb',
               encoding: 'utf8'
      end
    end
  end

  # GET /repair_orders/new
  def new
    @repair_order = RepairOrder.new
    @repair_assignment = @repair_order.repair_assignments.build
  end

  # GET /repair_orders/1/edit
  def edit
    redirect_to repair_orders_path if current_user != @repair_order.creator
  end

  # POST /repair_orders
  # POST /repair_orders.json
  def create
    @repair_order = current_user.repair_orders.new(repair_order_params)

    respond_to do |format|
      if @repair_order.save
        format.html { redirect_to @repair_order, notice: 'Repair order was successfully created.' }
        format.json { render :show, status: :created, location: @repair_order }
      else
        format.html { render :new }
        format.json { render json: @repair_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /repair_orders/1
  # PATCH/PUT /repair_orders/1.json
  def update
    respond_to do |format|
      if @repair_order.update(repair_order_params)
        format.html { redirect_to @repair_order, notice: 'Repair order was successfully updated.' }
        format.json { render :show, status: :ok, location: @repair_order }
      else
        format.html { render :edit }
        format.json { render json: @repair_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /repair_orders/1
  # DELETE /repair_orders/1.json
  def destroy
    @repair_order.destroy
    respond_to do |format|
      format.html { redirect_to repair_orders_url, notice: 'Repair order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def device_models
    @device_brand = DeviceBrand.find(params[:brand_id])
    @device_models = @device_brand.device_models
    @repair_order = params[:order_id].present? ? RepairOrder.find(params[:order_id]) :nil
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_repair_order
    @repair_order = RepairOrder.find(params[:id])
    @repair_assignment = @repair_order.repair_assignments.where(:transferred_job => false).last
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def repair_order_params
    params.require(:repair_order).permit(:device_brand_id, :device_model_id, :service_center_id, :imei1, :imei2,
                                         :purchase_date, :warranty, :customer_name, :customer_contact_no,
                                         :customer_email, :customer_address, :dealer, :full_boxed, :remarks,
                                         :invoice, :delivery_date, :device_condition => [], :accessories_present => [],
                                         :repair_assignments_attributes => [:assigner_id, :assigned_id, :transferred_job, :id]
    )
  end

  def can_crud?
    if current_user.is_admin? || current_user.is_receptionist?
      return true
    else
      return false
    end
  end
end
