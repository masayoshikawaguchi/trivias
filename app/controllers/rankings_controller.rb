class RankingsController < ApplicationController
  
  def clip
    @rank = Trivian.find(Clip.group(:trivian_id).order('count(trivian_id) desc').limit(5).pluck(:trivian_id))
  end
  
end
