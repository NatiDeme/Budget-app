class CategoriesController < ApplicationController
  before_action :authenticate_user!
  def index
    @category = Group.all
  end

  def new
    @category = Group.new
  end

  def create
    @category = Group.new(category_params)
    @category.user = current_user
    @category.save
    redirect_to categories_path
  end

  private

  def category_params
    params.require(:Category).permit!
  end
end
