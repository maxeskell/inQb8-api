class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :idea

  validates :body, length: { minimum: 2, maximum: 250 }, allow_blank: false
end
