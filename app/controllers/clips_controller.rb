class ClipsController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    @trivian = Trivian.find(params[:trivian_id])
    unless @trivian.iine?(current_user)
      @trivian.iine(current_user)
      @trivian.reload
      respond_to do |format|
        format.html { redirect_to request.referrer || root_url }
        format.js
      end
    end
  end

  def destroy
    @trivian = Clip.find(params[:id]).trivian
    if @trivian.iine?(current_user)
      @trivian.uniine(current_user)
      @trivian.reload
      respond_to do |format|
        format.html { redirect_to request.referrer || root_url }
        format.js
      end
    end
  end
  
  
  
end
