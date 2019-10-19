class Task < ApplicationRecord
  #バリデーション
  validates :status, presence: true , length: {maximum: 10}
  
  #userとの関連付け
  belongs_to :user
end
