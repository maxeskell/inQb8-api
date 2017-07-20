class UserSerializer < ActiveModel::Serializer
  has_many :comments
  belongs_to :idea
  has_many :ideas_loved
  has_many :ideas_joined
end
