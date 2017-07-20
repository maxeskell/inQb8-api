class CommentSerializer < ActiveModel::Serializer
  belongs_to :user
  belongs_to :idea
end
