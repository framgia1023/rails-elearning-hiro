class CategoriesController < ApplicationController

  def index
    @categories = Category.paginate(page: params[:page], per_page: 2)
    @words = Word.all
    @id_array = []
    @words.each do |word|
      @id_array << word.category_id
    end
    @lesson = Lesson.new
  end
  
end
