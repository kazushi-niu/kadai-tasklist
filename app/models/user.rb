class User < ApplicationRecord
  #保存前に大文字を小文字に変換
  before_save { self.email.downcase! }
  
  #バリデーション(name,emailの検証)
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },uniqueness: { case_sensitive: false }
  
  #パスワード機能(has_secure_password)
  has_secure_password
  
  #tasksとの関連付け
  has_many :tasks
end
