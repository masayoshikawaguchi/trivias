class ClipsController < ApplicationController
  before_action :require_user_logged_in
  
  
  def create
    @clip = Clip.create(user_id: current_user.id, trivian_id: params[:trivian_id])
    @clips = Clip.where(trivian_id: params[:trivian_id])
    @trivian = Trivian.find(params[:trivian_id])
    @trivian.reload
   
  end

  def destroy
    clip = Clip.find_by(user_id: current_user.id, trivian_id: params[:trivian_id])
    clip.destroy
    @clips = Clip.where(trivian_id: params[:trivian_id])
    @trivian = Trivian.find(params[:trivian_id])
    @trivian.reload
   
  end
  
 
end
