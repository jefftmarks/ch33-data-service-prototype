class EntitlementStatusSerializer < ActiveModel::Serializer
  attribute :va_file_number
  attribute :first_name
  attribute :last_name
  attribute :date_time_of_birth, key: :date_of_birth
  attribute :active_duty
  attribute :veteran_is_eligible
  attribute :eligibility_date_time, key: :eligibility_date
  attribute :delimiting_date_time, key: :delimiting_date
  attribute :percentage_benefit

  %i[original_entitlement used_entitlement remaining_entitlement].map do |entitlement|
    attribute(entitlement) { parse_months_from(object.send(entitlement))}
  end

  attribute :enrollments do
    object.enrollments.map { |enrollment| EnrollmentSerializer.new(enrollment) }
  end

  def parse_months_from(days)
    {
      months: (days / 30).floor,
      days: days % 30
    }
  end
end