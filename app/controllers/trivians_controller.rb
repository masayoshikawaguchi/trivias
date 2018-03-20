class TriviansController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]
  
  def index
    @trivians = Trivian.all.order('created_at DESC').page(params[:page])
    @clips = Clip.where(trivian_id: params[:trivian_id])
  end

  def new
    @trivian = current_user.trivians.build
  end

  def create
    @trivian = current_user.trivians.build(trivian_params)
    if @trivian.save
      flash[:success] = 'トリビアを投稿しました'
      redirect_to root_url
    else
      flash.now[:danger] = 'トリビアの投稿に失敗しました'
      render 'toppages/index'
    end
  end

  def destroy
    @trivian.destroy
    flash[:success] = 'トリビアを削除しました'
    redirect_back(fallback_location: root_path)
  end
  
  private
  
  def trivian_params
    params.require(:trivian).permit(:content, :category_id, :user_id)
  end
  
  def correct_user
    @trivian = current_user.trivians.find_by(id: params[:id])
    unless @trivian
      redirect_to root_url
    end
  end
end
