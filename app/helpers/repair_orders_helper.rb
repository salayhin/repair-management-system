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
end
