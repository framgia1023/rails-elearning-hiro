class LessonsController < ApplicationController
  before_action :require_login
  
  def new
  end

  def create
    @lesson = Lesson.new(lesson_params)
    if @lesson.save
      @lesson.create_activity(user_id: current_user.id)
      redirect_to new_lesson_answer_url(@lesson)
    end
  end
  
  def show 
    @answers = Answer.where(lesson_id: params[:id])
    @answer = Answer.find_by(lesson_id: params[:id])
    @lesson = Lesson.find_by(params[:id])
  end
  
  private
    def lesson_params
        params.require(:lesson).permit(:category_id).merge(user_id: current_user.id)
    end
        
end
