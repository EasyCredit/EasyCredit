class Credit < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :name, length: { minimum: 5, maximum: 100 }
  validates :description, presence: true
  validates :description, length: { minimum: 10, maximum: 200 }
  validates :month_count, presence: true
  validates :month_count, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 240 }
  validates :credit_rate, presence: true
  validates :credit_rate, numericality: { only_integer: true, greater_than_or_equal_to: 5, less_than_or_equal_to: 100 }
end
