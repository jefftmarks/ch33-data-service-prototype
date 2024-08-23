#frozen_string_literal: true

class EntitlementStatusesController < ApplicationController
  def show
    render json: entitlement_status
  end

  private

  def entitlement_status
    @entitlement_status ||= EntitlementStatus.find_by(va_file_number: params[:file_number])
  end
end
