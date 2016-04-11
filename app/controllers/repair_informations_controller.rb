class RepairInformationsController < ApplicationController
  before_action :set_repair_information, only: [:show, :edit, :update, :destroy]

  layout 'admin'

  # GET /repair_informations/1
  # GET /repair_informations/1.json
  def show
    @repair_order = @repair_information.repair_order
    if @repair_information.deliverable || (@repair_order.repair_assignments.last.assigned != current_user)
      redirect_to :back
    end
  end

  # POST /repair_informations
  # POST /repair_informations.json
  def create
    @repair_information = RepairInformation.new(repair_information_params)

    respond_to do |format|
      if @repair_information.save
        format.html { redirect_to @repair_information, notice: 'Repair information was successfully created.' }
        format.json { render :show, status: :created, location: @repair_information }
      else
        format.html { render :new }
        format.json { render json: @repair_information.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /repair_informations/1
  # PATCH/PUT /repair_informations/1.json
  def update
    respond_to do |format|
      if @repair_information.update(repair_information_params)
        format.html { redirect_to @repair_information, notice: 'Repair information was successfully updated.' }
        format.json { render :show, status: :ok, location: @repair_information }
      else
        format.html { render :edit }
        format.json { render json: @repair_information.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_repair_information
      @repair_information = RepairInformation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def repair_information_params
      params[:repair_information]
    end
end
