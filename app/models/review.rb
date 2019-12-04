class Review < ApplicationRecord
  belongs_to :reservation
  RATINGS = [
    1,
    2,
    3,
    4,
    5
  ]
  validates :rating, presence: true, numericality: { only_integer: true }, inclusion: { in: RATINGS }
  validates :content, presence: true
end
