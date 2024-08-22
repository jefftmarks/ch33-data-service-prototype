class EntitlementStatus < ApplicationRecord
  self.table_name = 'ch33_claimants_view'

  self.primary_key = 'id'

  has_many :enrollments, foreign_key: 'claimant_id', inverse_of: :entitlement_status, class_name: 'Enrollment', dependent: :destroy

  def readonly?
    true
  end
end
