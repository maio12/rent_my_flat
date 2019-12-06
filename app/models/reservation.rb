

class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :apartment
  has_one :review
  # validates :date_in, :date_out, presence: true, availability: true
  validate :date_out_after_date_in

 private

  def date_out_after_date_in
    return if date_out.blank? || date_in.blank?

    if date_out < date_in
      errors.add(:date_out, "must be after the start date")
    end
 end
end



  # validate :end_date_after_start_date

 #  private

 #  def end_date_after_start_date
 #    return if date_out.blank? || date_in.blank?

 #    if date_out < date_in
 #      errors.add(:date_out, "must be after the start date")
 #    end
 # end

