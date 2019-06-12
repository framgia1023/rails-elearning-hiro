class Admin::AdminController < ApplicationController
before_action :require_login

  private

  def admin_user
    unless current_user.admin?
      flash[:danger] = "You don't have authority."
      redirect_to(root_url) 
    end
  end
  
end