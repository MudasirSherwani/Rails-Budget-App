class CategoriesController < ApplicationController
    # before_action :authenticate_user!
    # load_and_authorize_resource
    before_action :set_user, only: %i[index new create destroy]
    before_action :set_category, only: %i[show edit update destroy]

  def index
    @categories = Category.includes(:users).order(created_at: :desc).with_attached_icon
  end

  def show
    @categories = Category.includes(:users).find(params['id'])
    redirect_to category_transactions_path(@category)
  end

  def new
    @category = Category.new(users: current_user)
  end

  def edit; end

  def create
    @users = User.find(current_user.id)
    @category = @users.categories.new(category_params)
    @category.icon.attach(params[:category][:icon])

    if @category.save
      redirect_to user_categories_path(current_user), notice: 'Category was successfully created.'
    else
      render :new
    end
  end

  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to category_url(@category), notice: 'Category was successfully updated.' }
        
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    puts plain: params
    @category = Category.find(params[:id])
    @category.destroy

    flash[:notice] = 'Category was successfully deleted'
    redirect_to root_path
  end

  private

  def set_category
    @category = Category.includes(:users).find(params[:id])
  end

def set_user
    @user = current_user
  end

  def category_params
    params.require(:category).permit(:name, :icon, :users_id)
  end
  
end
