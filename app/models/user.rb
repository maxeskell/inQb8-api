class User < ApplicationRecord
  mount_uploader :image, ImageUploader

  has_many :comments
  has_many :ideas
  has_and_belongs_to_many :ideas_loved, class_name: "Idea", join_table: "ideas_users_love"
  has_and_belongs_to_many :ideas_joined, class_name: "Idea", join_table: "ideas_users_join"

  has_secure_password validations: false

  validates :username, presence: true
  validates :email, presence: true, uniqueness: true, unless: :oauth_login?
  validates :password, presence: true, confirmation: true, unless: :oauth_login?

  def oauth_login?
    github_id.present? || facebook_id.present?
  end

  mount_uploader :image, ImageUploader

 end
