class AvailabilityValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value)
    reservations = Reservation.where(["apartment_id =?", record.apartment_id])
    date_ranges = reservations.map { |r| r.date_in..r.date_out }

    date_ranges.each do |range|
      if range.include? value
        record.errors.add(attribute, "not available")
      end
    end
  end
end
