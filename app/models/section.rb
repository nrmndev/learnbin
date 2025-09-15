class Section < ApplicationRecord
  belongs_to :article
  belongs_to :user, optional: true
  before_save :normalize_content
  acts_as_list scope: :article
  private

  def normalize_content
    self.content = content.to_s.gsub("\u00A0", ' ')
  end
end
