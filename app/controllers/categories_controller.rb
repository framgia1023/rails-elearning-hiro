class CategoriesController < ApplicationController

  def index
    @user = User.find(current_user.id)
    @lesson = Lesson.new
    if params[:status] == "learned"
      @categories = Category.joins(:words).group(:id).joins(:lessons).where(lessons: {user_id: @user.id}).where.not(lessons: {results: nil}).paginate(page: params[:page], per_page: 4)
    elsif params[:status] == "unlearned"
      @categories = Category.joins(:words).group(:id).joins("LEFT OUTER JOIN lessons ON categories.id = lessons.category_id AND lessons.user_id = #{@user.id}").where(lessons: {results: nil}).paginate(page: params[:page], per_page: 4)
      #left_joins(:lessons).where(lessons: {results: nil}).paginate(page: params[:page], per_page: 4)
    else
      @categories = Category.joins(:words).group(:id).paginate(page: params[:page], per_page: 4) #.where.not(words: {category_id: nil})
    end
  end
  
end