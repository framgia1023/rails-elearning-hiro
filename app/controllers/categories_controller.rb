class CategoriesController < ApplicationController

  def index
    @categories = Category.paginate(page: params[:page], per_page: 4)
    @words = Word.all
    @wordsarray = @words.to_a
    @array = []
    @words.each do |word|
      @array << word.category_id
    end
    @array2 = @array.uniq
  end
end
