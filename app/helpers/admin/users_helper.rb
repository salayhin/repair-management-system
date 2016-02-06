module Admin::UsersHelper
  def get_roles
    Role.all
  end
end
