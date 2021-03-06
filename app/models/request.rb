class Request < ApplicationRecord
  enum status: [:active, :approved, :rejected]
  after_initialize :set_default_status, if: :new_record?
  belongs_to :user

  def set_default_status
    self.status ||= :active
  end

  validates :email, presence: true
  validates :email, format: /@/
  validates :status, presence: true
  validates :credit_name, presence: true
  validates :credit_name, length: { minimum: 5, maximum: 100 }
end
