class Apartment < ApplicationRecord
  belongs_to :user
  has_many :reservations
  has_many :reviews, through: :reservations
  validates :title, presence: true
  validates :address, presence: true
  validates :photo, presence: true
  # mount_uploader :photo, PhotoUploader
end
