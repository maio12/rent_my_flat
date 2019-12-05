class Apartment < ApplicationRecord
  belongs_to :user
  has_many :reservations
  has_many :reviews, through: :reservations
  validates :title, presence: true
  validates :address, presence: true
  validates :price, presence: true
  validates :photo, presence: true
  mount_uploader :photo, PhotoUploader
  include PgSearch::Model
  pg_search_scope :search_by_address_and_title,
    against: [:address, :title],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end

