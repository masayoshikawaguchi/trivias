class Clip < ApplicationRecord
  belongs_to :user
  belongs_to :trivian
  counter_culture :trivian
  validates :user_id, presence: true
  validates :trivian_id, presence: true
end
