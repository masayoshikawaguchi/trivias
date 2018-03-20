class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category =Category.find(params[:id])
    @trivians = @category.trivians.order('created_at DESC').page(params[:page])
    @clips = Clip.where(trivian_id: params[:trivian_id])
  end
end
