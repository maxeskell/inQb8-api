class IdeaSerializer < ActiveModel::Serializer
  attributes :id, :title, :pitch, :description, :image_src, :campaign_duration, :who_we_need, :benefits_for_you, :created_at, :end_date, :days_left, :comments, :tags, :target, :loves, :joiners, :love_ids, :joiner_ids, :people_left

  belongs_to :user
  has_many :comments
  has_many :loves
  has_many :joiners
  has_many :tags

  def image_src
    object.image.url
  end

  def end_date
    c = object.created_at
    dur = object.campaign_duration
    c + dur.days
  end

  def days_left
    (end_date - Time.current).to_i / (24 * 60 * 60)
  end

  def people_left
    object.target - object.joiners.length
  end

end
