class Member < ApplicationRecord
  belongs_to :user, optional: true
  has_many :splits
  has_many :group_members
  validates :name, presence: true
end
