class Clip < ApplicationRecord
  belongs_to :user
  belongs_to :trivian, counter_cache: :clips_count
  validates :user_id, presence: true
  validates :trivian_id, presence: true
end
