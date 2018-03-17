class Trivian < ApplicationRecord
  belongs_to :user
  belongs_to :category
  
  validates :user_id, presence: true
  validates :category_id, presence: true
  validates :content, presence: true, length: { maximum: 255 }
  
  #1件のtrivianは複数のclipsを持つ
  has_many :clips, dependent: :destroy
  
  has_many :iine_users, through: :clips, source: :user
  
  def iine(user)
    clips.create(user_id: user.id)
  end
  
  def uniine(user)
    clips.find_by(user_id: user.id).destroy
  end
  
  def iine?(user)
    iine_users.include?(user)
  end
  
  
end
