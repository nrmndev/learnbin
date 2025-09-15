class Article < ApplicationRecord
  belongs_to :topic
  belongs_to :user, optional: true
  has_many :sections, dependent: :destroy
end
