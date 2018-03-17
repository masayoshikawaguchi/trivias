class User < ApplicationRecord
    validates :name, presence: true, length: { maximum: 50 }
    validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
    has_secure_password
    
    #1人が複数のtriviansを投稿できる
    has_many :trivians
    #1人が複数のclipsを持つ（一人で複数の投票をできる）
    has_many :clips, dependent: :destroy
    
end
