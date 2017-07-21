class TagSerializer < ActiveModel::Serializer
  attributes :id, :name, :ideas

  has_many :ideas
end
