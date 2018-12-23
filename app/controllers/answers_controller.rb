class AnswersController < ApplicationController

  def new
    @lesson = Lesson.find(params[:lesson_id])
    @lessons = Lesson.where(user_id: @lesson.user_id, category_id: @lesson.category_id )
    answer = @lesson.next_word
    if answer.nil?
      @correctcount = @lesson.choices.where(correct: true).count
      @lessons.update(results: @correctcount)
      #@results_nil_lesson = Lesson.where(user_id: @lesson.user_id, category_id: @lesson.category_id, results: nil )
      #if @results_nil_lesson.count != 0
        #@results_nil_lesson.destroy_all
      #else
      #end
      flash[:success] = "You answered all questions."
      redirect_to lesson_url(@lesson)
    else 
      @answer = @lesson.answers.build
    end
  end

  def create
    @lesson = Lesson.find(params[:lesson_id])
    @answer = @lesson.answers.build(answer_params)
    @answer.save
    redirect_to new_lesson_answer_url
  end

  private
  def answer_params
    params.require(:answer).permit(:lesson_id,:word_id,:choice_id)
  end

end
