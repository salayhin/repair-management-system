module Admin::PartsInventoriesHelper
  def all_parts
    PartsInventory.select(:name, :stock)
  end
end
