class EnrollmentSerializer < ActiveModel::Serializer
  attribute :begin_date_time, key: :begin_date
  attribute :end_date_time, key: :end_date
  attribute :facility_name
  attribute :facility_code
  attribute :yellow_ribbon_amount
  attribute :on_campus_hours
  attribute :online_hours
  attribute :amendments do
    object.amendments.map { |amendment| AmendmentSerializer.new(amendment) }
  end
end
