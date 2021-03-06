class Idea < ApplicationRecord
  mount_uploader :image, ImageUploader

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_and_belongs_to_many :loves, class_name: "User", join_table: "ideas_users_love"
  has_and_belongs_to_many :joiners, class_name: "User", join_table: "ideas_users_join"
  has_and_belongs_to_many :tags, class_name: "Tag", join_table: "ideas_tags"

  validates :title, length: { minimum: 3, maximum: 30 }, presence: true
  validates :pitch, length: { minimum: 10, maximum: 142 }, presence: true
  validates :description, length: { minimum: 10, maximum: 1000 }, allow_blank: false
  validates :image, presence: true
  validates :target, presence: true, numericality: { only_integer: true }
  validates :who_we_need, length: { minimum: 5, maximum: 250 }, presence: true
  validates :benefits_for_you, length: { minimum: 5, maximum: 250 }, presence: true
  validates :campaign_duration, presence: true, numericality: { only_integer: true }
end
