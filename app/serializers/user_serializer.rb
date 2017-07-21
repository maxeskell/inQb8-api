class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :first_name, :last_name, :email, :image, :github_id, :facbook_id, :created_at, :ideas_loved, :ideas_joined, :comments, :ideas

  has_many :comments
  has_many :ideas
  has_many :ideas_loved
  has_many :ideas_joined

end
