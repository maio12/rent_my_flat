class Apartment < ApplicationRecord
  belongs_to :user
  has_many :reservations
  has_many :reviews, through: :reservations
  validates :title, presence: true
  validates :address, presence: true
  validates :photo, presence: true
  mount_uploader :photo, PhotoUploader
  validates :price, presence: true
<<<<<<< HEAD

=======
  validates :photo, presence: true
  mount_uploader :photo, PhotoUploader
>>>>>>> master
end
