class ActivityCost < ApplicationRecord
  belongs_to :group
  has_many :splits
  validates :actual_cost, :split_type, :currency, presence: true
end
