class Apartment < ApplicationRecord
  belongs_to :user
  has_many :reservations
  has_many :reviews, through: :reservations
  #mount_uploader :photo, PhotoUploader
  validates :title, presence: true
  validates :address, presence: true
  #validates :photo, presence: true
end
