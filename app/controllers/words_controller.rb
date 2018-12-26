class WordsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @lessons = @user.lessons
    @learnwordscount =  Lesson.joins("INNER JOIN words ON lessons.category_id = words.category_id").where(lessons: {user_id: @user.id}).count
  end
  
end
