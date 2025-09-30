class Post < ApplicationRecord
  extend FriendlyId
  include Visibility
  belongs_to :user
  friendly_id :title, use: [:slugged, :scoped], scope: :user

  has_many :parts, -> { order(:position) }, dependent: :destroy
  has_many :topic_posts, dependent: :destroy
  has_many :topics, through: :topic_posts
  validates :title, presence: true,
    length: {
    minimum: 6,
    maximum: 50,
    too_short: "must be at least %{count} characters",
    too_long: "must be at most %{count} characters"
  }

  scope :search_by_title, ->(term) {
    return all if term.blank?
    where("title ILIKE :q OR description ILIKE :q", q: "%#{term}%")
  }

  def should_generate_new_friendly_id?
    title.present? && super
  end
end
