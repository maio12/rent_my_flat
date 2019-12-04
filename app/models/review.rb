class Review < ApplicationRecord
  belongs_to :reservation
  RATINGS = [
    0,
    1,
    2,
    3,
    4,
    5
  ]
  validates :content, presence: true
  validates :rating, numericality: { only_integer: true }, inclusion: { in: RATINGS }
end
