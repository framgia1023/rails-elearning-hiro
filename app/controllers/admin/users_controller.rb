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
    flash[:success] = "Successfully deleted a user."
    redirect_to admin_users_path
  end

  def update
    @user = User.find(params[:id])
    if @user.admin?
      @user.update(admin:false)
    else
      @user.update(admin:true)
    end 
    @user.save
    redirect_to request.referer
  end

end

