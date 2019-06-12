class CategoriesController < ApplicationController

  def index
    @lesson = Lesson.new
    if params[:status] == "learned"
      @categories = Category.joins(:lessons).where(lessons: {user_id: current_user.id}).where.not(lessons: {results: nil})
    elsif params[:status] == "unlearned"
      @categories = Category.joins("LEFT OUTER JOIN lessons ON categories.id = lessons.category_id AND lessons.user_id = #{current_user.id}").where(lessons: {results: nil})
      abort
    else
      @categories = Category.all 
    end
    @categories = @categories.joins(:words).group(:id).paginate(page: params[:page], per_page: 4)
  end
  
end