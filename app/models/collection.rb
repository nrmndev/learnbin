class Collection < ApplicationRecord
  include Visibility
  has_many :collection_topics, -> { order(:position) }, dependent: :destroy
  has_many :topics, through: :collection_topics

  acts_as_taggable_on :tags  # tag contexts “tags” for general tags

  validates :title, presence: true
  validates :slug, presence: true, uniqueness: true
end
