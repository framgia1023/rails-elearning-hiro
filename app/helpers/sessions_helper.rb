module SessionsHelper

  def current_user
    User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def current_user?(user)
    current_user == user
  end

end
