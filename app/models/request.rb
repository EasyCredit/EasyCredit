class Request < ApplicationRecord
  enum status: [:active, :approved, :rejected]
  after_initialize :set_default_status, if: :new_record?
  belongs_to :user
  belongs_to :credit

  def set_default_status
    self.status ||= :active
  end
end
