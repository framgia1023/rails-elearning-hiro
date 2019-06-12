class AnswersController < ApplicationController
  before_action :require_login

  def new
    @lesson = Lesson.find(params[:lesson_id])
    #@lessons = Lesson.where(user_id: @lesson.user_id, category_id: @lesson.category_id )
    answer = @lesson.next_word
    if answer.nil?
      @correctcount = @lesson.choices.where(correct: true).count
      @lesson.update(results: @correctcount)
      @results_nil_lesson = current_user.lessons.where(category_id: @lesson.category_id, results: nil)
      unless @results_nil_lesson.nil?
        @results_nil_lesson.destroy_all
      end
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
