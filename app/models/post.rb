class Post < ApplicationRecord
  include Visibility
  belongs_to :topic
  belongs_to :user

  has_many :parts, dependent: :destroy

  validates :title, presence: true
end
