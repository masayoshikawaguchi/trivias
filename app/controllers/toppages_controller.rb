class ToppagesController < ApplicationController
  def index
    @categories = Category.all
    @trivians = Trivian.all.order('created_at DESC').page(params[:page])
  end
end
