class ActivityCost < ApplicationRecord
  belongs_to :group
  has_many :splits, dependent: :destroy
  validates :actual_cost, :currency, :paid_by, presence: true
end
