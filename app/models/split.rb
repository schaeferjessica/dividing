class Split < ApplicationRecord
  belongs_to :activity_cost
  belongs_to :member
  # validates :individual_balances, presence: true
  validates :individual_balances, numericality: { greater_than_or_equal_to: 0, allow_nil: true }
end
