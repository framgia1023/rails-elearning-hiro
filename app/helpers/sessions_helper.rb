module SessionsHelper

  def current_user
    User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def require_login
    unless logged_in?
      flash[:danger] = "Please login to gain access."
      redirect_to root_url
    end
  end

  def current_user?(user)
    current_user == user
  end

end
