class Member < ApplicationRecord
  belongs_to :user, optional: true
  has_many :splits, dependent: :destroy
  has_many :group_members, dependent: :destroy
  has_many :groups, through: :group_members
  validates :name, presence: true
end
