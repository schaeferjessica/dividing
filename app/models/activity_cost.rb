class ActivityCost < ApplicationRecord
  belongs_to :group
  has_many :splits
  validates :actual_cost, :currency, :paid_by, presence: true
end
