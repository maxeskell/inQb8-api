class TagSerializer < ActiveModel::Serializer
  has_and_belongs_to_many :ideas
end
