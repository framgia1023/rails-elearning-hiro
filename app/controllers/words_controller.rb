class WordsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @lessons = @user.lessons
  end
end
