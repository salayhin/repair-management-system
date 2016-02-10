module ApplicationHelper
  def admins?
    if current_user.present?
      current_user.role?(:admin) || current_user.role?(:super_admin)
    else
      return false
    end
  end

end
