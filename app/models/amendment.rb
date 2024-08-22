#frozen_string_literal: true

class Amendment < ApplicationRecord
  self.table_name = 'ch33_amendments_view'

  self.primary_key = 'id'

  belongs_to :enrollment, optional: true

  def readonly?
    true
  end
end
