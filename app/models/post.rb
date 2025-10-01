class Post < ApplicationRecord
  # extend FriendlyId
  # friendly_id :title, use: [:slugged, :scoped]
  include Visibility
  belongs_to :user

  # Topic-Post Relation
  has_many :topic_posts, -> { order(:position) }, dependent: :destroy
  has_many :topics, through: :topic_posts

  # Post-Part Relation
  has_many :post_parts, -> { order(:position) }, dependent: :destroy
  has_many :parts, through: :post_parts


  validates :title, presence: true,
    length: {
    minimum: 5,
    maximum: 255,
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
