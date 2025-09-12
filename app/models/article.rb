class Article < ApplicationRecord
  belongs_to :topic
  has_many :sections, dependent: :destroy
end
