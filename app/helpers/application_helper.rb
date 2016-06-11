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

  def all_activity_status
    ActivityStatus.order('updated_at DESC')
  end

  def all_final_status
    FinalStatus.order('updated_at DESC')
  end

  def profile_photo
    if current_user
      current_user.profile.photo.present? ? current_user.profile.photo_url(:thumb) : 'profile_small.jpg'
    else
      'profile_small.jpg'
    end
  end
end
