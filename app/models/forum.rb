class Forum < ApplicationRecord
  has_many :forum_users
  has_many :users, through: :forum_users
  validates :name, presence: true, uniqueness: true
end
