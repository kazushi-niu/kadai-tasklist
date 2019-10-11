class Task < ApplicationRecord
  validates :status, presence: true , length: {maximum: 5}
end
