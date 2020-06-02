class ActivityCost < ApplicationRecord
  belongs_to :group
  has_many :splits
  validates :actual_cost, :split_type, :currency, :paid_by, presence: true
end
