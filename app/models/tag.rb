class Tag < ApplicationRecord
  has_and_belongs_to_many :ideas, class_name: "Idea", join_table: "idea_tag"

  validates :name, presence: true
  validates :name, length: { minimum: 2, maximum: 20 }, allow_blank: false

end
