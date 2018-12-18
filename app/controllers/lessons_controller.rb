class LessonsController < ApplicationController

  def new
  end

  def create
    @lesson = Lesson.new(lesson_params)
    if @lesson.save
        redirect_to new_lesson_answer_url(@lesson)
    end
  end
  
  private
    def lesson_params
        params.require(:lesson).permit(:category_id).merge(user_id: current_user.id)
    end
        
end
