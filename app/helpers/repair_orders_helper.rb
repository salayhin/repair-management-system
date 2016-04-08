module RepairOrdersHelper

  def all_service_centers
    ServiceCenter.order('created_at DESC')
  end

  def all_device_brands
    DeviceBrand.order('created_at DESC')
  end

  def select_device_model(brand)
    DeviceBrand.find(brand).device_models.order('created_at DESC')
  end

  def service_center_employees
    current_profile = current_user.profile
    all_employees = current_profile.service_center.profiles.where.not(id: current_profile.id)
    return all_employees
  end
end
