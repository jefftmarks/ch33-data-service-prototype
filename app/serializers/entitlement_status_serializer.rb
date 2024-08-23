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
  attribute :original_entitlement
  attribute :used_entitlement
  attribute :remaining_entitlement
  attribute :enrollments
end
