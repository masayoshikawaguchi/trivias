class ToppagesController < ApplicationController
  def index
    @categories = Category.all
    @trivians = Trivian.all.order('created_at DESC').page(params[:page])
    @clips = Clip.where(trivian_id: params[:trivian_id])
  end
  
end
