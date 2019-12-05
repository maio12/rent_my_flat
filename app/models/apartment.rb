class Apartment < ApplicationRecord
  belongs_to :user
  has_many :reservations
  has_many :reviews, through: :reservations
  validates :title, presence: true
  validates :city, presence: true
  validates :address, presence: true
  validates :photo, presence: true
  mount_uploader :photo, PhotoUploader
  validates :price, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  include PgSearch::Model
  pg_search_scope :search_by_address_and_title,
    against: [:address, :title],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
