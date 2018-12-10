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

end

