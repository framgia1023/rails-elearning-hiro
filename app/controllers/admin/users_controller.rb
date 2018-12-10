class Admin::UsersController < Admin::AdminController
  before_action :require_login, only: [:index, :destroy]
  before_action :admin_user, only: [:index, :destroy]

  def new
  end

  def index
    @users = User.paginate(page: params[:page], per_page: 4)
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to admin_users_path
  end

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

