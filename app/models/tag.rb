class Tag < ApplicationRecord
  has_and_belongs_to_many :ideas, class_name: "Idea", join_table: "ideas_tags"

  # validates :name, inclusion: { in: @allowed_tags }
  validates :name, presence: true
  validates :name, length: { minimum: 2, maximum: 20 }

  allowed_tags = %w[HR operations finance risk compliance strategy partnerships marketing sales product research logistics process]

end
