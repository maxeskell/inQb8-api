class IdeaSerializer < ActiveModel::Serializer
  attributes :id, :title, :pitch, :description, :image_src, :campaign_duration, :who_we_need, :benefits_for_you, :created_at, :comments, :tags, :target

  belongs_to :user
  has_many :comments
  has_many :lovers
  has_many :joiners
  has_many :tags

  def image_src
    object.image.url
  end

end
