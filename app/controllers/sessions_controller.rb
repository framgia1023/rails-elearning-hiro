class SessionsController < ApplicationController
    
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "Successfully logged in."
      redirect_to feed_url
    else
      flash[:danger] = "Invalid Credentials. Please log in again!"
      #render 'new'
      redirect_to root_url
    end
  end

  def destroy
    session.delete(:user_id)
    #redirect_to login_url
    redirect_to root_url
  end
    
end
