class Admin::WordsController < Admin::AdminController

  def index
    @category = Category.find(params[:category_id])
    @words = @category.words
    @correctchoices = Choice.where(correct: true)
  end

  def new
    @category = Category.find(params[:category_id])
    @word = @category.words.build
    3.times do
      @word.choices.build
    end
  end

  def create
    @category = Category.find(params[:category_id])
    @word = @category.words.build(word_params)
    if @word.save
      flash[:success] = "Successfully created a word."
      redirect_to admin_category_words_url
    else 
      render 'new'
    end
  end

  def edit
    @word = Word.find(params[:id])
    @category = Category.find(params[:category_id])
  end

  def update
    @word = Word.find(params[:id])
    @category = Category.find(params[:category_id])
    if @word.update_attributes(update_word_params)
      flash[:success] = "Successfully updated the word."
      redirect_to admin_category_words_url
    else 
      render 'edit'
    end
  end

  def destroy
    @word = Word.find(params[:id])
    @word.destroy
    redirect_to admin_category_words_url
  end

  private
    def word_params
      params.require(:word).permit(:word, choices_attributes: [:choice, :correct])
    end

    def update_word_params
      params.require(:word).permit(:word, choices_attributes: [:choice, :correct, :id])
    end

end
