module RepairInformationsHelper

  def order_delivered(order)
    return order.repair_information.deliverable
  end

  def is_assigned_technician(order)
    return order.repair_assignments.last.assigned == current_user
  end

end
