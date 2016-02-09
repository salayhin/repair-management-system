module Admin::UsersHelper
  def get_roles
    if current_user.is_super_admin?
      Role.all
    else
      Role.last(4)
    end
  end
end
