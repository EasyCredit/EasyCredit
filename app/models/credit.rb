class Credit < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :name, length: { minimum: 5 }
  validates :description, presence: true
  validates :description, length: { minimum: 10 }
  validates :month_count, presence: true
  validates :month_count, numericality: { only_integer: true }
  validates :credit_rate, presence: true
end
