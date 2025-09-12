class Section < ApplicationRecord
  belongs_to :article
  before_save :normalize_content

  private

  def normalize_content
    self.content = content.to_s.gsub("\u00A0", ' ')
  end
end
