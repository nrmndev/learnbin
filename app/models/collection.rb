class Collection < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: [:slugged, :scoped], scope: :user

  include Visibility
  belongs_to :user
  has_many :collection_topics, -> { order(:position) }, dependent: :destroy
  has_many :topics, through: :collection_topics

  acts_as_taggable_on :tags  # tag contexts “tags” for general tags

  validates :slug, uniqueness: { scope: :user_id, message: "you already have a topic with that slug" }, allow_nil: true
  validates :title,
    length: {
    minimum: 6,
    maximum: 50,
    too_short: "for collection must be at least %{count} characters",
    too_long: "for collection must be at most %{count} characters"
  }, uniqueness: { scope: :user_id, message: "you already have a collection with that title" }

  scope :user_page_search, ->(term) {
    return all if term.blank?
    # Use left_outer_joins through posts (Rails figures out through topic_posts)
    where("title ILIKE :q", q: "%#{term}%")
  }

  def should_generate_new_friendly_id?
    title.present? && super
  end
end
