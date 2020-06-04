class Group < ApplicationRecord
  belongs_to :user, optional: true
  has_many :activity_costs, dependent: :destroy
  has_many :splits, through: :activity_costs
  has_many :group_members, dependent: :destroy
  has_many :members, through: :group_members
  validates :group_name, presence: true
  validates :group_name, uniqueness: true
end
