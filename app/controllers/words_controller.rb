class WordsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @categories = @user.categories
    # if params[:title].present?
    #   @category = Category.find(params[:title])
    #   @answers = @category.answers.all.where(lessons: {user_id: @user.id})
    # else
    #   @answers = @user.answers
    # end
    if params[:status]
      @category = Category.find(params[:status])
      @answers = @category.answers.all.where(lessons: {user_id: @user.id})
      @category_name = @category.title 
    else
      @answers = @user.answers
      @category_name = "All"
    end
    @answers = @answers.paginate(page: params[:page], per_page: 7)
    @learnwordscount =  Lesson.joins("INNER JOIN words ON lessons.category_id = words.category_id").where(lessons: {user_id: @user.id}).where.not(lessons: {results: nil}).count
  end
  
end
