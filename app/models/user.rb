class User < ApplicationRecord
  has_many :comments
  belongs_to :idea
  has_many :ideas_loved, class_name: `Idea`, join_table: `ideas_users_love`
  has_many :ideas_joined, class_name: `Idea`, join_table: `ideas_users_join`

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
end
