module ProfilesHelper
  def user_role(profile)
    profile.user.roles.first.name
  end
end
