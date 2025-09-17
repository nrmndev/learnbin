class Part < ApplicationRecord
  include Visibility
  belongs_to :post
  belongs_to :user

  validates :title, presence: true
  before_save :normalize_content
  acts_as_list scope: :post
  private

  def normalize_content
    self.description = description.to_s.gsub("\u00A0", ' ')
  end
end
