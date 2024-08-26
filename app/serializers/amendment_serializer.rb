class AmendmentSerializer < ActiveModel::Serializer
  attribute :residence_hours
  attribute :distance_hours
  attribute :amendment_type
  attribute :amendment_effective_date
end
