class Trivian < ApplicationRecord
  belongs_to :user
  belongs_to :category
  
  validates :user_id, presence: true
  validates :category_id, presence: true
  validates :content, presence: true, length: { maximum: 255 }
end
