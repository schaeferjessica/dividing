class ActivityCost < ApplicationRecord
  CURRENCY = ["EUR", "USD"]
  belongs_to :group
  has_many :splits, dependent: :destroy
  validates :actual_cost, :paid_by, presence: true
  validates :actual_cost, :service_tip, :employer_contribution, numericality: { greater_than_or_equal_to: 0 }

  validates :currency, inclusion: { in: CURRENCY }
end
