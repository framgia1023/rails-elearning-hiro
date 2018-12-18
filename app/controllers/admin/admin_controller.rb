class Admin::AdminController < ApplicationController
     
  private

  def admin_user
    unless current_user.admin?
      flash[:info] = "You don't have authority."
      redirect_to(root_url) 
    end
  end

  def require_login
    unless logged_in?
      flash[:info] = "Please login to gain access."
      redirect_to login_url
    end
  end

end