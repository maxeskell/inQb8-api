class Tag < ApplicationRecord
  has_and_belongs_to_many :ideas, class_name: "Idea", join_table: "ideas_tags"

  validates :name, inclusion: { in: %w(HR Ops Finance Risk Compliance Strategy partnerships Marketing sales Product Research Logistics Process),
    message: "%{value} is not a valid tag" }
  validates :name, presence: true
  validates :name, length: { minimum: 2, maximum: 20 }

end
