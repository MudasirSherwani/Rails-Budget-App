class OperationsController < ApplicationController
  before_action :redirect_unauthenticated_user_to_custom_page
  before_action :set_user

  def index
    if params[:category_id].present?
      @category = Category.find(params[:category_id])
      @transaxtions = @user.operations.includes(:category).where(category: @category)
      @total_amount = @transaxtions&.sum(:amount) || 0
    else
      @transaxtions = @user.operations
    end
    @page_name = 'Transactions'
  end

  def create
    @operation = @user.operations.build(operation_params)
    @categories = @user.categories
    @category = Category.find(params[:operation][:category_id]) if params[:operation][:category_id].present?
    @operation.category = @category
    if @operation.save
      Categorization.create(operation: @operation, category: @category)
      redirect_to category_operations_path(@operation.category)
    else
      puts @operation.errors.full_messages
      render :new
    end
  end

  def new
    @operation = @user.operations.build
    @categories = @user.categories
    @category = Category.find(params[:category_id]) if params[:category_id].present?
    @page_name = 'Add New Transaction'
  end

  private

  def set_user
    @user = current_user
  end

  def operation_params
    params.require(:operation).permit(:name, :amount, :category_id, :author_id)
  end

  def redirect_unauthenticated_user_to_custom_page
    return if user_signed_in?

    redirect_to '/users/'
  end
end
