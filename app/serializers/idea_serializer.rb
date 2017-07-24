class IdeaSerializer < ActiveModel::Serializer
  require 'date'

  attributes :id, :title, :pitch, :description, :image_src, :campaign_duration, :who_we_need, :benefits_for_you, :created_at, :comments, :tags, :target, :loves, :joiners, :love_ids, :joiner_ids, :days_remaining

  belongs_to :user
  has_many :comments
  has_many :loves
  has_many :joiners
  has_many :tags

  def image_src
    object.image.url
  end

  def days_remaining
    c = object.created_at
    dur = object.campaign_duration
    c + dur.days
  end

end
