class Bookmark < ApplicationRecord
  belongs_to :topic
  belongs_to :user
  has_many :likes, dependent: :destroy

  scope :sorted_by_topic, -> { order('topic_id DESC') }
end
