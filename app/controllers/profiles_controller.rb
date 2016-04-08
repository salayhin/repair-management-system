# all user has a profile
# user can see others profile but cannot update
class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profile, only: [:show, :edit, :update]
  before_action :load_service_centers

  layout 'admin'

  def show
  end

  # GET /profiles/1/edit
  def edit
    if current_user.is_super_admin? || current_user.profile == @profile || current_user.is_admin?
      # redirect_to edit_profile_path(params[:id])
    else
      redirect_to edit_profile_path(current_user.profile)
    end
  end

  # PATCH/PUT /profiles/1
  # PATCH/PUT /profiles/1.json
  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to @profile, notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_profile
    @profile = Profile.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :address, :mobile, :photo, :service_center_id)
  end

  def load_service_centers
    @service_centers = ServiceCenter.order('updated_at DESC')
  end

end
