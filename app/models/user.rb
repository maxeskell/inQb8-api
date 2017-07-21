class User < ApplicationRecord
  has_many :comments
  has_many :ideas
  has_many :ideas_loved, class_name: "Idea", join_table: "ideas_users_love"
  has_many :ideas_joined, class_name: "Idea", join_table: "ideas_users_join"
  has_secure_password validations: false

  validates :username, presence: true
  validates :email, presence: true, uniqueness: true, unless: :oauth_login?
  validates :password, presence: true, confirmation: true, unless: :oauth_login?, on: :create

  def oauth_login?
    github_id.present? || facebook_id.present?
  end
 end
