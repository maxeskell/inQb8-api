class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :first_name, :last_name, :email, :image_src, :github_id, :facebook_id, :created_at, :ideas_loved, :ideas_joined, :comments, :ideas, :ideas_loved_ids, :ideas_joined_ids

  has_many :comments
  has_many :ideas
  has_many :ideas_loved
  has_many :ideas_joined

  def image_src
    object.image.url
  end

end
