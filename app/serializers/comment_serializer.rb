class CommentSerializer < ActiveModel::Serializer
    attributes :id, :subject, :body, :created_at, :user, :idea

    belongs_to :user
    belongs_to :idea
end
