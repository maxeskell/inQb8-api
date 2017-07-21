class Idea < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_and_belongs_to_many :loves, class_name: "User", join_table: "ideas_users_love"
  has_and_belongs_to_many :joiners, class_name: "User", join_table: "ideas_users_join"
  has_and_belongs_to_many :tags, class_name: "Tag", join_table: "ideas_tags"

  validates :title, length: { minimum: 2, maximum: 30 }, allow_blank: false
  validates :pitch, length: { minimum: 2, maximum: 142 }, allow_blank: false
  validates :description, length: { minimum: 2, maximum: 1000 }, allow_blank: false
  validates :image, presence: true
  validates :campaign_duration, presence: true, numericality: { only_integer: true }
  validates :who_we_need, length: { minimum: 2, maximum: 250 }, allow_blank: false
  validates :benefits_for_you, length: { minimum: 2, maximum: 250 }, allow_blank: false

  mount_uploader :image, ImageUploader

end
