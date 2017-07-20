class Idea < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_and_belongs_to_many :lovers, class_name: "User", join_table: "ideas_users_love"
  has_and_belongs_to_many :joiners, class_name: "User", join_table: "ideas_users_join"
  has_and_belongs_to_many :tags, class_name: "Tag", join_table: "ideas_tag"
end
