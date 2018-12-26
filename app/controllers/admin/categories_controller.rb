class Admin::CategoriesController < Admin::AdminController
  before_action :admin_user

  def index
    @categories = Category.all.paginate(page: params[:page], per_page: 9)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "Successfully created a category."
      redirect_to admin_categories_url
    else
      render 'new'
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    @category.update_attributes(category_params)
    redirect_to admin_categories_url
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to admin_categories_url
  end

  private
    def category_params
        params.require(:category).permit(:title,:description)
    end
  
end


