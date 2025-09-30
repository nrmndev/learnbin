class Part < ApplicationRecord
  extend FriendlyId
  include Visibility
  belongs_to :post
  belongs_to :user

  friendly_id :title, use: [:slugged, :scoped], scope: :post

  validates :title, presence: true,
    length: {
    minimum: 6,
    maximum: 50,
    too_short: "must be at least %{count} characters",
    too_long: "must be at most %{count} characters"
  }
  before_save :normalize_content
  acts_as_list scope: :post

  private

  def normalize_content
    self.description = description.to_s.gsub("\u00A0", ' ')
  end

  def should_generate_new_friendly_id?
    title.present? && super
  end
end
