class Topic < ApplicationRecord
  # extend FriendlyId
  # friendly_id :title, use: [:slugged, :scoped]
  include Visibility
  belongs_to :user

  # Collection-Topic Relation
  has_many :collection_topics, dependent: :destroy
  has_many :collections, through: :collection_topics

  # Topic-Post Relation
  has_many :topic_posts, -> { order(:position) }, dependent: :destroy
  has_many :posts, through: :topic_posts

  # Topic-Part Relation
  has_many :parts, through: :posts

  validates :title,
    length: {
    minimum: 5,
    maximum: 50,
    too_short: "must be at least %{count} characters",
    too_long: "must be at most %{count} characters"
  }
  #, uniqueness: { scope: :user_id, message: "you already have a topic with that title" }

  # validates :slug, uniqueness: { scope: :user_id, message: "you already have a topic with that slug" }, allow_nil: true

  scope :user_page_search, ->(term) {
    return all if term.blank?
    # Use left_outer_joins through posts (Rails figures out through topic_posts)
    left_outer_joins(:posts)
      .where(
        "topics.title ILIKE :q OR posts.title ILIKE :q",
        q: "%#{term}%"
      )
      .distinct
  }

  before_save :reset_slug_if_title_changed
  def reset_slug_if_title_changed
    if title_changed?
      self.slug = nil
    end
  end

  def should_generate_new_friendly_id?
    title.present? && super
  end
end
