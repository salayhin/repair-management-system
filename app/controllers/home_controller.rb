class HomeController < ApplicationController
  def index
    @admin_users = Role.find(2).users.sample(3)
  end
end
