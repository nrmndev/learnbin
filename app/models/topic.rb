class Topic < ApplicationRecord
  include Visibility
  belongs_to :user  # or `belongs_to :author, class_name: "User"`, for consistency

  has_many :collection_topics, dependent: :destroy
  has_many :collections, through: :collection_topics

  has_many :topic_posts, -> { order(:position) }, dependent: :destroy
  has_many :posts, through: :topic_posts

  has_many :parts, through: :posts
  acts_as_taggable_on :tags

  validates :title, presence: true
  # slug optional? If you need friendly URLs for topics
  validates :slug, uniqueness: true, allow_nil: true
 #enum visibility: { visible: 0, private: 1, hidden: 2 }, _suffix: true
end
