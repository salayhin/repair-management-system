module ApplicationHelper
  def admins?
    if current_user.present?
      current_user.role?(:admin) || current_user.role?(:super_admin)
    else
      return false
    end
  end

  def attach_class
    if params[:controller].include?('/')
      return params[:controller].split('/').last + '-' + params[:action]
    else
      return params[:controller] + '-' + params[:action]
    end
  end
end
