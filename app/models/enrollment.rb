#frozen_string_literal: true

class Enrollment < ApplicationRecord
  self.table_name = 'ch33_enrollments_view'

  self.primary_key = 'id'

  has_many :amendments, dependent: :destroy

  belongs_to :entitlement_status, foreign_key: 'claimant_id', optional: true

  alias entitlement entitlement_status

  def readonly?
    true
  end
end
