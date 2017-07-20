class IdeaSerializer < ActiveModel::Serializer
  belongs_to :user
    has_many :comments
    has_and_belongs_to_many :lovers
    has_and_belongs_to_many :joiners
    has_and_belongs_to_many :tags
end
