class Post < ApplicationRecord
  include Visibility
  belongs_to :user

  has_many :parts, -> { order(:position) }, dependent: :destroy
  has_many :topic_posts, dependent: :destroy
  has_many :topics, through: :topic_posts
  validates :title, presence: true
end
