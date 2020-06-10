class ActivityCost < ApplicationRecord
  CURRENCY = ["EUR", "USD", "GBP"]
  belongs_to :group
  has_many :splits, dependent: :destroy
  validates :actual_cost, :paid_by, :split_type, presence: true
  validates :actual_cost, :service_tip, :employer_contribution, numericality: { greater_than_or_equal_to: 0, allow_nil: true }

  validates :currency, inclusion: { in: CURRENCY }
end
