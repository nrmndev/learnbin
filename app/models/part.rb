class Part < ApplicationRecord
  #extend FriendlyId
  # friendly_id :title, use: [:slugged, :scoped]

  include Visibility
  belongs_to :user
acts_as_list scope: :post_parts
  # Post-Part Relation
  has_many :post_parts, -> { order(:position) }, dependent: :destroy
  has_many :posts, through: :post_parts


  validates :title, presence: true,
    length: {
    minimum: 5,
    maximum: 255,
    too_short: "must be at least %{count} characters",
    too_long: "must be at most %{count} characters"
  }
  before_save :normalize_content
  #acts_as_list scope: :post


  scope :search, ->(term) {
    return all if term.blank?
    where("title ILIKE :q OR description ILIKE :q", q: "%#{term}%")
  }

  private

  def normalize_content
    self.description = description.to_s.gsub("\u00A0", ' ')
  end

  def should_generate_new_friendly_id?
    title.present? && super
  end
end
