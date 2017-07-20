class Tag < ApplicationRecord
  has_and_belongs_to_many :ideas, class_name: "Idea", join_table: "idea_tag"
end
