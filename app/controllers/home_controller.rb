class HomeController < ApplicationController
  def index
    @admin_users = Role.find(2).users.sample(3)
  end

  def local_switcher
    if params[:locale_set]
      I18n.locale = params[:locale_set].to_sym
      set_session_and_redirect
    end
  end

  def parts_names
    results = PartsInventory.where("name LIKE ?", "#{params[:search_key]}%").limit(5)
    results = results.select("id,name")
    render :json => results.to_json
  end

  private
  def set_session_and_redirect
    session[:locale] = I18n.locale
    redirect_to :back
  rescue ActionController::RedirectBackError
    redirect_to :root
  end
end
