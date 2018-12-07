class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    # @user.image = "default.png"
    if @user.save
      redirect_to root_url
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def feed
  end

  def index
    @users = User.paginate(page: params[:page], per_page: 4)
  end

  def following
    @user  = User.find(params[:id])
    @users = @user.following
    render 'show_follow'
  end

  def followers
    @user  = User.find(params[:id])
    @users = @user.followers
    render 'show_follower'
  end



  private
  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation)
  end
  
  
end
