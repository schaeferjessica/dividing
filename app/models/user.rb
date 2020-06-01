class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :groups, dependent: :destroy
  has_many :members, dependent: :destroy
  has_many :activity_costs, through: :groups
  has_many :group_members, through: :members
  has_many :splits, through: :members
  validates :username, :password, :email, presence: true
  validates :username, :email, uniqueness: true
end
