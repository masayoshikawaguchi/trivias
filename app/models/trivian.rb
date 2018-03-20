class Trivian < ApplicationRecord
  belongs_to :user
  belongs_to :category
  
  validates :user_id, presence: true
  validates :category_id, presence: true
  validates :content, presence: true, length: { maximum: 255 }
  
  #1件のtrivianは複数のclipsを持つ
  has_many :clips, dependent: :destroy
 
 
  def clip_user(user_id)
    clips.find_by(user_id: user_id)
  end
  
 
    
end
