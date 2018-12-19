class AnswersController < ApplicationController

  def new
    @lesson = Lesson.find(params[:lesson_id])
    answer = @lesson.next_word
    if answer.nil?
      @correctcount = @lesson.choices.where(correct: true).count
      @lesson.update(results: @correctcount)
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
