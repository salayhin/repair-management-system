class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user

    if user.role? :admin
      super_admin(user)
    elsif (user.role? :receptionist) || (user.role? :technician) || (user.role? :top_level_technician)
      member user
    else
      guest
    end
  end

  # Ability for supper admin
  def super_admin(user)
    can :manage, :all
  end

  # Ability for seller
  def member(user)
    # see https://github.com/gregbell/active_admin/blob/master/docs/13-authorization-adapter.md#using-the-cancan-adapter
    cannot :manage, ActiveAdmin::Page
    cannot :create, Admin::User
    cannot :update, Admin::User
  end

  # Ability for NilClass
  def guest
  end
end
